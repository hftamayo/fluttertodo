import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_list.dart';
import 'package:fluttertodo/provider/tasks_provider.dart';

class DisplayTasks extends StatelessWidget {
  const DisplayTasks({
    Key? key,
    // required this.list,
  }) : super(key: key);

  // final TaskList list;

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<TasksProvider>(context);
    return ListView.builder(
      itemBuilder: (_, int index) {
        return Card(
          margin: const EdgeInsets.all(4),
          elevation: 8,
          child: ListTile(
            title: Text(
              // list.items[index].title,
              list.allTasks[index].title,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              // list.items[index].body,
              list.allTasks[index].body,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        );
      },
      // itemCount: list.items.length,
      itemCount: list.allTasks.length,
    );
  }
}
