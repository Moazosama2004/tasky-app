import 'package:flutter/material.dart';

class TodoTasksView extends StatelessWidget {
  const TodoTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff181818),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xffFFFCFC)),
        title: Text(
          'TodoTasksView',
          style: TextStyle(color: Color(0xffFFFCFC)),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
