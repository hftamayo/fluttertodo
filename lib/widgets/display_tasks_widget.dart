import 'package:flutter/material.dart';

import '../models/todo_list.dart';

class DisplayTasks extends StatelessWidget {
  const DisplayTasks({
    Key? key,
    required this.list,
  }) : super(key: key);

  final TodoList list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
    );
  }
}
