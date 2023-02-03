import 'package:flutter/material.dart';

class LangProvider with ChangeNotifier {
  String _languageCode = 'en';
  String get languageCode => _languageCode;

  set languageCode(String language) {
    _languageCode = language;
    notifyListeners();
  }
}
