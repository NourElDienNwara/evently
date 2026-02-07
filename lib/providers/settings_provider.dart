import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode themeMode = .light;

  void changeTheme(ThemeMode theme) {
    themeMode = theme;
    notifyListeners();
  }

  bool get isDark => themeMode == .dark;
}
