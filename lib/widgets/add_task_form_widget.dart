import 'package:flutter/material.dart';
import 'package:fluttertodo/models/task.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fluttertodo/provider/tasks_provider.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddTaskState createState() {
    return _AddTaskState();
  }
}

class _AddTaskState extends State<AddTask> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String newTitle = '';
  String newBody = '';

  void _onSave() {
    if (_formKey.currentState!.validate()) {
      final task = Task(title: titleController.text, body: bodyController.text);
      Provider.of<TasksProvider>(context, listen: false).addTask(task);
      Navigator.of(context).pop<Task>(task);
      var snackBar = SnackBar(
          content: Text(AppLocalizations.of(context)!.addTaskToasterText));
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
    Widget buildTextField(
        String hint, TextEditingController controller, bool requestFocus) {
      return Container(
        margin: const EdgeInsets.all(4),
        child: TextFormField(
          autofocus: requestFocus,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please fill all input fields';
            }
          },
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
      child: Form(
        key: _formKey,
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
              buildTextField(AppLocalizations.of(context)!.taskTitleHint,
                  titleController, true),
              buildTextField(AppLocalizations.of(context)!.taskBodyHint,
                  bodyController, false),
              ElevatedButton(
                onPressed: _onSave,
                child: Text(AppLocalizations.of(context)!.addTaskButtonText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
