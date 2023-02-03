import 'package:fluttertodo/enums/app_theme_enum.dart';
import 'package:fluttertodo/provider/lang_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertodo/pages/home_page.dart';
import 'package:fluttertodo/widgets/mainbar_widget.dart';
import 'package:provider/provider.dart';
import 'package:fluttertodo/provider/tasks_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => TasksProvider()),
    ChangeNotifierProvider(create: (context) => LangProvider())
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  ThemeData theme = AppTheme.indigo.theme;
  static MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<MyAppState>();

  void setTheme(ThemeData theme) {
    setState(() {
      this.theme = theme;
    });
  }

  @override
  Widget build(BuildContext context) {
    final TasksProvider tasksProvider = Provider.of<TasksProvider>(context);
    final LangProvider langProvider = Provider.of<LangProvider>(context);
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      title: 'Tasks V1',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: const [Locale('en'), Locale('es')],
      locale: Locale(langProvider.languageCode),
      home: FutureBuilder(
        future: tasksProvider.loadStore,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return const Scaffold(
              appBar: MainBar(),
              body: Home(),
            );
          } else {
            return const Scaffold(
              appBar: MainBar(),
              body: Center(child: Text('A Loading widget in a future')),
            );
          }
        }),
      ),
    );
  }
}
