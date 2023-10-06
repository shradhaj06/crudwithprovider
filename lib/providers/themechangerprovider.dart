import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class ThemeChanger with ChangeNotifier{
  ThemeData _currentThemeData = ThemeData.light();

  ThemeData get currentTheme => _currentThemeData;

  void toggleTheme() {
    _currentThemeData =
    _currentThemeData == ThemeData.light() ? ThemeData.dark() : ThemeData.light();
    notifyListeners();
  }
}