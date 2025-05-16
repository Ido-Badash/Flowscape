import 'package:flutter/material.dart';
import 'package:flowscape/core/styles/themes.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = appDarkThemeData;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    themeData =
        _themeData == appDarkThemeData ? appLightThemeData : appDarkThemeData;
  }
}
