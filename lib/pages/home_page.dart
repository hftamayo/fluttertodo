import 'package:flutter/material.dart';
import 'package:fluttertodo/models/task_list.dart';
import 'package:fluttertodo/widgets/mainbar_widget.dart';
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
  late TaskList list = TaskList();

  void _formAddTask() {
    final task = showDialog(
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
  void initState() {
    Provider.of<TasksProvider>(context, listen: false).loadStore();
    Provider.of<TasksProvider>(context, listen: false).getListOfTasks();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainBar(
        backgroundColor: Colors.indigo,
      ),
      body: const DisplayTasks(),
      floatingActionButton: ButtonAddTask(onPressed: _formAddTask),
    );
  }
}
