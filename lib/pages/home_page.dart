import 'package:flutter/material.dart';
import 'package:fluttertodo/models/task.dart';
import 'package:fluttertodo/models/task_list.dart';
import 'package:fluttertodo/widgets/mainbar_widget.dart';
import 'package:fluttertodo/widgets/display_tasks_widget.dart';
import 'package:fluttertodo/widgets/new_task_button_widget.dart';
import 'package:fluttertodo/widgets/add_task_form_widget.dart';
import 'package:fluttertodo/assets/constants.dart' as constants;
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import 'package:fluttertodo/provider/tasks_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TaskList list = TaskList();
  LocalStorage? storage;

  // Future _loadStore() async {
  //   if (storage != null) {
  //     return list;
  //   }
  //   storage = LocalStorage(constants.flutterTodoStorageName);
  //   await storage!.ready;
  // }

  // getListOfTasks() async {
  //   if (storage != null) {
  //     List<dynamic>? storedTasks =
  //         await storage?.getItem(constants.tasksStorageKey);
  //     if (storedTasks != null) {
  //       list.items = List<Task>.from(
  //         storedTasks.map(
  //           (item) => Task(item['title'], item['body']),
  //         ),
  //       );
  //       print("number of tasks: ${storedTasks.length}");
  //     } else {
  //       print("the list is empty");
  //     }
  //   }

  //unstable List<dynamic>? storedTasks =
  //     await storage?.getItem(constants.tasksStorageKey);
  // if (storedTasks != null) {
  //   list = storedTasks.map((task) => TodoList().toJSONEncodable()) as TodoList;
  // } else {
  //   list = [] as TodoList;
  // }
  // return list;
  // }

  void addTask(Task task) {
    setState(() {
      // list.items.add(task);
      storage?.setItem(constants.tasksStorageKey, list.toJSONEncodable());
      Provider.of<TasksProvider>(context, listen: false).getListOfTasks();
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
    Provider.of<TasksProvider>(context, listen: false).loadStore();
    // _loadStore();
    Provider.of<TasksProvider>(context, listen: false).getListOfTasks();
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
      body: const DisplayTasks(),
      floatingActionButton: ButtonAddTask(onPressed: _formAddTask),
    );
  }
}
