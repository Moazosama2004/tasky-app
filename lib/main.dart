import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky_app/views/home_view.dart';
import 'package:tasky_app/views/welcome_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  bool isVisited = prefs.getBool('isVisited') ?? false;
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
      theme: ThemeData(useMaterial3: true),
      home: _navigateTo(isVisited: isVisited),
    );
  }

  Widget _navigateTo({required bool isVisited}) {
    if (isVisited) {
      return HomeView();
    }
    return WelcomeView();
  }
}
