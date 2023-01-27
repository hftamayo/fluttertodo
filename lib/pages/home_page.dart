import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertodo/models/task.dart';
import 'package:fluttertodo/models/task_list.dart';
import 'package:fluttertodo/widgets/mainbar_widget.dart';
import 'package:fluttertodo/widgets/display_tasks_widget.dart';
import 'package:fluttertodo/widgets/new_task_button_widget.dart';
import 'package:fluttertodo/widgets/add_task_form_widget.dart';
import 'package:fluttertodo/assets/constants.dart' as constants;
import 'package:localstorage/localstorage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TaskList list = TaskList();
  LocalStorage? storage;

  Future _loadStore() async {
    if (storage != null) {
      return list;
    }
    storage = LocalStorage(constants.flutterTodoStorageName);
    await storage!.ready;
  }

  getListOfTasks() async {
    if (storage != null) {
      List<dynamic>? storedTasks =
          await storage?.getItem(constants.tasksStorageKey);
      if (storedTasks != null) {
        print("number of tasks: ${list.items.length}");
        // list =
        //     storedTasks.map((task) => TaskList().toJSONEncodable()) as TaskList;
      } else {
        print("the list is empty");
        // list = [] as TaskList;
      }
      //return list;

      // List<dynamic>? storedTasks =
      //     await storage?.getItem(constants.tasksStorageKey);
      // if (storedTasks != null) {
      //   list = storedTasks.map((task) => TaskList()) as TaskList;
      // }
      // List<dynamic>? storedTasks =
      //     await storage?.getItem(constants.tasksStorageKey);
      // if (storedTasks != null) {
      //   list =
      //       storedTasks.map((task) => TodoList().toJSONEncodable()) as TodoList;
      // }

    }
    //stable  setState(() {
    //   list.items = storage.getItem(constants.flutterTodoStorageName) ?? [];
    // });

    //unstable List<dynamic>? storedTasks =
    //     await storage?.getItem(constants.tasksStorageKey);
    // if (storedTasks != null) {
    //   list = storedTasks.map((task) => TodoList().toJSONEncodable()) as TodoList;
    // } else {
    //   list = [] as TodoList;
    // }
    // return list;
  }

  // void _taskList() {
  //   if (list.items != null) {
  //     list.items = List<Task>.from(
  //       list.items.map(
  //         (item) => Task(item['title'] item['body']),
  //       ),
  //     );
  //   }
  // }

  void addTask(Task task) {
    setState(() {
      list.items.add(task);
      storage?.setItem(constants.tasksStorageKey, list.toJSONEncodable());
      getListOfTasks();
    });
  }

  void _formAddTask() {
    final task = showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: AddTask(addTask),
        );
      },
    );
  }

  @override
  void initState() {
    _loadStore();
    getListOfTasks();
    super.initState();
  }

  @override
  void dispose() {
/*     _store.close(); */
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainBar(
        backgroundColor: Colors.indigo,
        title: 'Flutter Todo V1',
      ),
      body: DisplayTasks(list: list),
      floatingActionButton: ButtonAddTask(onPressed: _formAddTask),
    );
  }
}
