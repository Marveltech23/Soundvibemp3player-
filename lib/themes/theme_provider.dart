import 'package:flutter/material.dart';
import 'package:soundvibe/themes/dark_mode.dart';
import 'package:soundvibe/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;

  //get theme
  ThemeData get themeData => _themeData;

  // is  dark mode
  bool get isDarkMode => _themeData == darkMode;

//set  theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

//toggle theme
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
