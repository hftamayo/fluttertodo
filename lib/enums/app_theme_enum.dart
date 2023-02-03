import 'package:flutter/material.dart';

enum AppTheme {
  indigo,
  dark;

  ThemeData get theme {
    switch (this) {
      case AppTheme.indigo:
        return ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
          ),
          colorScheme: const ColorScheme.light(background: Colors.indigo),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.orangeAccent,
              foregroundColor: Colors.black),
        );
      case AppTheme.dark:
        return ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
          ),
          colorScheme: const ColorScheme.light(background: Colors.black),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.orangeAccent,
              foregroundColor: Colors.white),
        );

      default:
        return ThemeData();
    }
  }
}
