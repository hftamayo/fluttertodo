import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      tooltip: AppLocalizations.of(context)!.addTaskToaster,
      onPressed: onPressed,
      child: const Icon(Icons.add),
    );
  }
}
