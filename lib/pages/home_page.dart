import 'package:flutter/material.dart';
import 'package:fluttertodo/models/task.dart';
import 'package:fluttertodo/models/todo_list.dart';
import 'package:fluttertodo/widgets/add_task_widget.dart';
import 'package:localstorage/localstorage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TodoList list = TodoList();
  final LocalStorage storage = LocalStorage('fluttertodo');

  void addTask(Task task) {
    setState(() {
      list.items.add(task);
      storage.setItem('fluttertodo', list.toJSONEncodable());
      // _taskList();
    });
  }

  void _loadStore() {
    setState(() {
      list.items = storage.getItem('fluttertodo') ?? [];
    });
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
      appBar: AppBar(
        title: const Text(
          "ToDo List",
          style: TextStyle(fontSize: 19.0),
        ),
        backgroundColor: Colors.indigo,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.add), onPressed: () => debugPrint("Add")),
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: () => debugPrint("Search")),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (_, int index) {
          return Card(
            margin: const EdgeInsets.all(4),
            elevation: 8,
            child: ListTile(
              title: Text(
                list.items[index].title,
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.indigo,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                list.items[index].body,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          );
        },
        itemCount: list.items.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _formAddTask();
        },
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
