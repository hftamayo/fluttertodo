import 'package:flutter/material.dart';

class ButtonAddTask extends StatelessWidget {
  final GestureTapCallback onPressed;

  const ButtonAddTask({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.orangeAccent,
      foregroundColor: Colors.white,
      tooltip: 'Add a Task',
      onPressed: onPressed,
      child: const Icon(Icons.add),
    );
  }
}
