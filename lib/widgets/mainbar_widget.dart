import 'package:fluttertodo/enums/app_theme_enum.dart';
import 'package:fluttertodo/main.dart';
import 'package:fluttertodo/provider/lang_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class MainBar extends StatelessWidget implements PreferredSizeWidget {
  const MainBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    final LangProvider langProvider = Provider.of<LangProvider>(context);
    return AppBar(
      title: Text(AppLocalizations.of(context)!.appName),
      centerTitle: true,
      titleTextStyle: const TextStyle(fontSize: 19.0),
      backgroundColor: Theme.of(context).colorScheme.background,
      actions: <Widget>[
        IconButton(
            icon: const Icon(Icons.brush),
            tooltip: AppLocalizations.of(context)!.changeTheme,
            onPressed: () =>
                {MyAppState.of(context)!.setTheme(AppTheme.dark.theme)}),
        IconButton(
            icon: const Icon(Icons.arrow_circle_left),
            tooltip: AppLocalizations.of(context)!.switchSpanish,
            onPressed: () => {langProvider.languageCode = 'es'}),
        IconButton(
            icon: const Icon(Icons.arrow_circle_right),
            tooltip: AppLocalizations.of(context)!.switchEnglish,
            onPressed: () => {langProvider.languageCode = 'en'}),
      ],
    );
  }
}
