import 'package:flutter/material.dart';
import 'package:fluttertodo/models/task.dart';
import 'package:fluttertodo/add_task.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Task> listData = [];

  void addTask(Task task) {
    setState(() {
      listData.add(task);
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
    print('The task created was $task');
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
                listData[index].title,
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.indigo,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                listData[index].body,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          );
        },
        itemCount: listData.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _formAddTask(),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
