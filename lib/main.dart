import 'package:flutter/material.dart';
import 'package:tasky_app/core/services/preferences_manager.dart';
import 'package:tasky_app/core/theme/dark_theme.dart';
import 'package:tasky_app/core/theme/light_theme.dart';
import 'package:tasky_app/core/theme/theme_controller.dart';

import 'package:tasky_app/views/main_view.dart';
import 'package:tasky_app/views/welcome_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesManager().init();
  bool isVisited = PreferencesManager().getBool('isVisited') ?? false;
  ThemeController.init();
  runApp(TaskyApp(isVisited: isVisited));
}

class TaskyApp extends StatelessWidget {
  const TaskyApp({super.key, required this.isVisited});
  final bool isVisited;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeController.themeNotifier,
      builder: (context, ThemeMode themeMode, Widget? child) =>
          MaterialApp(
            title: 'Tasky',
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themeMode,
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
