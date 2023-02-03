import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor;

  const MainBar({
    Key? key,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      title: Text(AppLocalizations.of(context)!.appName),
      centerTitle: true,
      titleTextStyle: const TextStyle(fontSize: 19.0),
      actions: <Widget>[
        IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () => debugPrint("Add")),
        IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => debugPrint("Search")),
      ],
    );
  }
}
