import 'package:flutter/material.dart';
import './theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = AppThemes.dark;
  bool _isDark = true;

  bool get isDark => _isDark;
  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    _isDark = !_isDark;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == AppThemes.dark) {
      themeData = AppThemes.light;
    } else {
      themeData = AppThemes.dark;
    }
  }
}
