import 'package:flutter/material.dart';
import 'package:fluttertodo/models/task.dart';
import 'package:fluttertodo/provider/tasks_provider.dart';

class AddTask extends StatefulWidget {
  final Function(Task) addTask;
  const AddTask(this.addTask, {super.key});

  @override
  _AddTaskState createState() {
    return _AddTaskState();
  }
}

class _AddTaskState extends State<AddTask> {
  late TextEditingController titleController;
  late TextEditingController bodyController;
  String newTitle = '';
  String newBody = '';

  void _onSave() {
    final task = Task(titleController.text, bodyController.text);
    widget.addTask(task);
    Navigator.of(context).pop<Task>(task);
    var snackBar = const SnackBar(content: Text('New Task Added'));
    if (task != null) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  void initState() {
    super.initState();
    // titleController = TextEditingController();
    // bodyController = TextEditingController();
    titleController.addListener(() {
      newTitle = titleController.text;
    });
    bodyController.addListener(() {
      newBody = bodyController.text;
    });
  }

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget buildTextField(String hint, TextEditingController controller) {
      return Container(
        margin: const EdgeInsets.all(4),
        child: TextField(
          decoration: InputDecoration(
            labelText: hint,
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black38,
              ),
            ),
          ),
          controller: controller,
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(8),
      height: 350,
      width: 400,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Add New Task',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Colors.blueGrey,
              ),
            ),
            buildTextField('Title', titleController),
            buildTextField('Body', bodyController),
            ElevatedButton(
              onPressed: _onSave,
              child: const Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
