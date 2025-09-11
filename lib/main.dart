import 'package:flutter/material.dart';
import 'package:tasky_app/views/welcome_view.dart';

void main() {
  runApp(TaskyApp());
}

class TaskyApp extends StatelessWidget {
  const TaskyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasky',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: WelcomeView(),
    );
  }
}
