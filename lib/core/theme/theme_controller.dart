import 'package:flutter/material.dart';
import 'package:tasky_app/core/services/preferences_manager.dart';

class ThemeController {
  static final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(
    ThemeMode.dark,
  );

  static init() {
    bool isDarkMode = PreferencesManager().getBool('isDarkMode') ?? false;
    themeNotifier.value = isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  static toggleTheme() async {
    final isDarkMode = themeNotifier.value == ThemeMode.dark
        ? false
        : true;
    themeNotifier.value = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    await PreferencesManager().setBool('isDarkMode', isDarkMode);
  }

  static isDark() => themeNotifier.value == ThemeMode.dark;
}
