import 'package:flutter/material.dart';
import 'package:fluttertodo/widgets/display_tasks_widget.dart';
import 'package:fluttertodo/widgets/new_task_button_widget.dart';
import 'package:fluttertodo/widgets/add_task_form_widget.dart';
import 'package:provider/provider.dart';
import 'package:fluttertodo/provider/tasks_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _formAddTask() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: const AddTask(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final TasksProvider tasksProvider = Provider.of<TasksProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: DisplayTasks(tasks: tasksProvider.tasks),
      floatingActionButton: ButtonAddTask(onPressed: _formAddTask),
    );
  }
}
