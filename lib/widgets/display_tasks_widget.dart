import 'package:flutter/material.dart';
import 'package:fluttertodo/models/task.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DisplayTasks extends StatelessWidget {
  const DisplayTasks({
    Key? key,
    required this.tasks,
  }) : super(key: key);

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    // TasksProvider tasksProvider =
    //     Provider.of<TasksProvider>(context, listen: false);
    if (tasks.isEmpty) {
      return const _EmptyContext();
    } else {
      return ListView.builder(
        itemBuilder: (_, int index) {
          return Card(
            margin: const EdgeInsets.all(4),
            elevation: 8,
            child: ListTile(
              title: Text(
                // list.items[index].title,
                tasks[index].title,
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.indigo,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                // list.items[index].body,
                tasks[index].body,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          );
        },
        // itemCount: list.items.length,
        itemCount: tasks.length,
      );
    }
  }
}

class _EmptyContext extends StatelessWidget {
  const _EmptyContext();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(AppLocalizations.of(context)!.noTaskToDisplay),
    );
  }
}
