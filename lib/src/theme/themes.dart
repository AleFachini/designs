import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;
  ThemeData _currentTheme = ThemeData.fallback();

  ThemeChanger(int theme) {
    switch (theme) {
      case 1: //light
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
        break;
      case 2: //dark
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark();
        break;
      case 3: //custom
        _darkTheme = false;
        _customTheme = true;
        _currentTheme = ThemeData.light();
        break;
      default:
    }
  }

  ThemeData get currentTheme => this._currentTheme;

  bool get darkTheme => this._darkTheme;

  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;
    if (value) {
      _currentTheme = ThemeData.dark();
    } else {
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }

  bool get customTheme => this._customTheme;

  set customTheme(bool value) {
    _darkTheme = false;
    _customTheme = value;
    if (value) {
      _currentTheme = ThemeData.light();
    } else {
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }
}
