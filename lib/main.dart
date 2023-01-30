import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertodo/pages/home_page.dart';
import 'package:fluttertodo/provider/tasks_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => TasksProvider()),
      child: MaterialApp(
        title: 'TasksV1',
        localizationsDelegates: [AppLocalizations.delegate],
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: const Home(),
      ),
    );
  }
}
