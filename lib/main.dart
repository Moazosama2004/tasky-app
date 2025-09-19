import 'package:flutter/material.dart';
import 'package:tasky_app/core/services/preferences_manager.dart';
import 'package:tasky_app/core/theme/dark_theme.dart';
import 'package:tasky_app/core/theme/light_theme.dart';

import 'package:tasky_app/views/main_view.dart';
import 'package:tasky_app/views/welcome_view.dart';

ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(
  ThemeMode.dark,
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesManager().init();
  bool isVisited = PreferencesManager().getBool('isVisited') ?? false;
  bool isDarkMode =
      PreferencesManager().getBool('isDarkMode') ?? false;
  themeNotifier.value = isDarkMode ? ThemeMode.dark : ThemeMode.light;
  runApp(TaskyApp(isVisited: isVisited));
}

class TaskyApp extends StatelessWidget {
  const TaskyApp({super.key, required this.isVisited});
  final bool isVisited;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, ThemeMode value, Widget? child) =>
          MaterialApp(
            title: 'Tasky',
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: value,
            home: _navigateTo(isVisited: isVisited),
          ),
    );
  }

  Widget _navigateTo({required bool isVisited}) {
    if (isVisited) {
      return MainView();
    }
    return WelcomeView();
  }
}
