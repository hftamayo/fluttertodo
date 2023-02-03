import 'package:flutter/material.dart';
import 'package:fluttertodo/models/task.dart';
import 'package:provider/provider.dart';
import 'package:fluttertodo/provider/tasks_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  _AddTaskState createState() {
    return _AddTaskState();
  }
}

class _AddTaskState extends State<AddTask> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  String newTitle = '';
  String newBody = '';

  void _onSave() {
    final task = Task(titleController.text, bodyController.text);
    Provider.of<TasksProvider>(context, listen: false).addTask(task);
    Navigator.of(context).pop<Task>(task);
    var snackBar = SnackBar(
        content: Text(AppLocalizations.of(context)!.addTaskToasterText));
    if (task != null) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  void initState() {
    super.initState();
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
            Text(
              AppLocalizations.of(context)!.newTaskFormTitle,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Colors.blueGrey,
              ),
            ),
            buildTextField(
                AppLocalizations.of(context)!.taskTitleHint, titleController),
            buildTextField(
                AppLocalizations.of(context)!.taskBodyHint, bodyController),
            ElevatedButton(
              onPressed: _onSave,
              child: Text(AppLocalizations.of(context)!.addTaskButtonText),
            ),
          ],
        ),
      ),
    );
  }
}
