// import 'package:flutter/material.dart';
// import 'package:localstorage/localstorage.dart';
// import 'package:fluttertodo/assets/constants.dart' as constants;
// import 'package:fluttertodo/models/task.dart';
// import 'package:fluttertodo/models/todo_list.dart';

// class TaskProvider with ChangeNotifier {
//   late TodoList list = TodoList();
//   LocalStorage? _storage;

//   @override
//   void dispose() {
//     _storage?.dispose();
//     super.dispose();
//   }

//   Future init() async {
//     if (_storage != null) {
//       return list;
//     }
//     _storage = LocalStorage(constants.flutterTodoStorageName);
//     await _storage!.ready;

//     List<dynamic>? storageTasks =
//         await _storage?.getItem(constants.tasksStorageKey);
//     list = storageTasks != null
//         ? storageTasks.map((task) => TodoList().toJSONEncodable())
//         : [];
//     notifyListeners();
//     return list;
//   }

//   Future saveTask(Task? task) async {
//     if (task == null) {
//       return;
//     }
//   }
// }
