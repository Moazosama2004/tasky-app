import 'package:flutter/material.dart';

class CompletedTasksView extends StatelessWidget {
  const CompletedTasksView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff181818),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xffFFFCFC)),
        title: Text(
          'CompletedTasksView',
          style: TextStyle(color: Color(0xffFFFCFC)),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
