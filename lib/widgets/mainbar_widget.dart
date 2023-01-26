import 'package:flutter/material.dart';

class MainBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;

  const MainBar({
    Key? key,
    required this.title,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      title: Text(title),
      centerTitle: true,
      titleTextStyle: const TextStyle(fontSize: 19.0),
      actions: <Widget>[
        IconButton(
            icon: const Icon(Icons.add), onPressed: () => debugPrint("Add")),
        IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => debugPrint("Search")),
      ],
    );
  }
}
