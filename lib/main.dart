import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky_app/views/home_view.dart';
import 'package:tasky_app/views/main_view.dart';
import 'package:tasky_app/views/welcome_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  bool isVisited = prefs.getBool('isVisited') ?? false;
  // prefs.clear();
  runApp(TaskyApp(isVisited: isVisited));
}

class TaskyApp extends StatelessWidget {
  const TaskyApp({super.key, required this.isVisited});
  final bool isVisited;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasky',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff181818),
        switchTheme: SwitchThemeData(
          trackColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return Color(0xff15B86C);
            }
            return Colors.white;
          }),
          thumbColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.white;
            }
            return Colors.grey;
          }),
          trackOutlineColor: WidgetStateProperty.resolveWith((
            states,
          ) {
            if (states.contains(WidgetState.selected)) {
              return Colors.transparent;
            }
            return Colors.grey;
          }),
          trackOutlineWidth: WidgetStateProperty.resolveWith((
            states,
          ) {
            if (states.contains(WidgetState.selected)) {
              return 0;
            }
            return 2;
          }),
        ),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Color(0xffFFFCFC)),
          titleTextStyle: TextStyle(
            color: Color(0xffFFFCFC),
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        useMaterial3: true,
      ),
      home: _navigateTo(isVisited: isVisited),
    );
  }

  Widget _navigateTo({required bool isVisited}) {
    if (isVisited) {
      return MainView();
    }
    return WelcomeView();
  }
}
