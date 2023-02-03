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
      tooltip: AppLocalizations.of(context)!.addTaskToasterText,
      onPressed: onPressed,
      child: const Icon(Icons.add),
    );
  }
}
