import 'package:flutter/material.dart';
import 'package:fluttertodo/models/task.dart';

class AddTask extends StatefulWidget {
  final Function(Task) addTask;
  AddTask(this.addTask);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    Widget buildTextField(String hint, TextEditingController controller) {
      return Container(
        margin: EdgeInsets.all(4),
        child: TextField(
          decoration: InputDecoration(
            labelText: hint,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black38,
              ),
            ),
          ),
          controller: controller,
        ),
      );
    }

    var titleController = TextEditingController();
    var bodyController = TextEditingController();

    return Container(
      padding: EdgeInsets.all(8),
      height: 350,
      width: 400,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Add Title',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Colors.blueGrey,
              ),
            ),
            buildTextField('Title', titleController),
            buildTextField('Body', bodyController),
            ElevatedButton(
              onPressed: () {
                final task = Task(titleController.text, bodyController.text);
                widget.addTask(task);
                Navigator.of(context).pop();
              },
              child: Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
