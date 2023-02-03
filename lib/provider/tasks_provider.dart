import 'package:flutter/material.dart';
import 'package:fluttertodo/models/task.dart';
import 'package:localstorage/localstorage.dart';
import 'package:fluttertodo/assets/constants.dart' as constants;

class TasksProvider with ChangeNotifier {
  late List<Task> tasks;
  LocalStorage? storage;

  Future<List<Task>> get loadStore async {
    if (storage != null) {
      return tasks;
    }
    storage = LocalStorage(constants.flutterTodoStorageName);
    await storage!.ready;

    List<dynamic>? storedTasks =
        await storage?.getItem(constants.tasksStorageKey);
    tasks = storedTasks != null
        ? storedTasks.map((task) => Task.fromMap(task)).toList()
        : [];
    // notifyListeners();
    return tasks;
  }

  @override
  void dispose() {
    storage?.dispose();
    super.dispose();
  }

  Future addTask(Task? task) async {
    if (task == null) {
      return;
    }
    tasks.add(task);
    await storage!.setItem(
        constants.tasksStorageKey, tasks.map((task) => task.toMap()).toList());
    notifyListeners();
  }
}
