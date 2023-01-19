import 'package:flutter/material.dart';
import 'package:fluttertodo/models/task.dart';
import 'package:fluttertodo/AddTask.dart';

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
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "ToDo List",
          style: new TextStyle(fontSize: 19.0),
        ),
        backgroundColor: Colors.indigo,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.add), onPressed: () => debugPrint("Add")),
          new IconButton(
              icon: new Icon(Icons.search),
              onPressed: () => debugPrint("Search")),
        ],
      ),
      body: new Container(
        child: new ListView.builder(
          itemBuilder: (_, int index) {
            return Card(
              margin: EdgeInsets.all(4),
              elevation: 8,
              child: ListTile(
                title: Text(
                  listData[index].title,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  listData[index].body,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            );
          },
          itemCount: this.listData.length,
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => _formAddTask(),
        child: new Icon(Icons.add),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
    );
  }
}
