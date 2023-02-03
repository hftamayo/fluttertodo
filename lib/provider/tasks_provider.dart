import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:fluttertodo/models/task.dart';
import 'package:fluttertodo/models/task_list.dart';
import 'package:localstorage/localstorage.dart';
import 'package:fluttertodo/assets/constants.dart' as constants;

class TasksProvider with ChangeNotifier {
  late TaskList list = TaskList();
  List<Task> _tasks = [];
  LocalStorage? storage;

  UnmodifiableListView<Task> get allTasks => UnmodifiableListView(_tasks);

  Future loadStore() async {
    if (storage != null) {
      return list;
    }
    storage = LocalStorage(constants.flutterTodoStorageName);
    await storage!.ready;
  }

  @override
  void dispose() {
    storage?.dispose();
    super.dispose();
  }

  getListOfTasks() async {
    if (storage != null) {
      List<dynamic>? storedTasks =
          await storage?.getItem(constants.tasksStorageKey);
      if (storedTasks != null) {
        list.items = List<Task>.from(
          storedTasks.map(
            (item) => Task(item['title'], item['body']),
          ),
        );
        notifyListeners();
        print("number of tasks: ${storedTasks.length}");
      } else {
        print("the list is empty");
      }
    }
  }

  void addTask(Task task) {
    storage?.setItem(constants.tasksStorageKey, list.toJSONEncodable());
    notifyListeners();
  }
}
