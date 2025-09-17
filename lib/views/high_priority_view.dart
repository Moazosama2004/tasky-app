import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky_app/models/task_model.dart';
import 'package:tasky_app/core/widgets/tasks_list_view_builder.dart';

class HighPriorityView extends StatefulWidget {
  const HighPriorityView({super.key});

  @override
  State<HighPriorityView> createState() => _HighPriorityViewState();
}

class _HighPriorityViewState extends State<HighPriorityView> {
  List<TaskModel> highPrioritytasks = [];
  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final finalTask = prefs.getString('tasks');
    if (finalTask != null) {
      final taskAfterDecoded = jsonDecode(finalTask) as List<dynamic>;
      highPrioritytasks = taskAfterDecoded.reversed
          .map((e) => TaskModel.fromJson(e))
          .where((e) => e.isHighPriority)
          .toList();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('High Priority Tasks')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: TasksListViewBuilder(
          tasks: highPrioritytasks,
          onChanged: (value, index) async {
            highPrioritytasks[index!].isDone = value ?? false;
            final prefs = await SharedPreferences.getInstance();

            final fullTasks = prefs.getString('tasks');

            if (fullTasks != null) {
              List<TaskModel> fullTasksList =
                  (jsonDecode(fullTasks) as List<dynamic>)
                      .map((e) => TaskModel.fromJson(e))
                      .toList();
              final int comparingIndex = fullTasksList.indexWhere(
                (e) => e.id == highPrioritytasks[index].id,
              );
              fullTasksList[comparingIndex] =
                  highPrioritytasks[index];
              await prefs.setString(
                'tasks',
                jsonEncode(fullTasksList),
              );
              _loadTasks();
              setState(() {});
            }
          },
        ),
      ),
    );
  }
}
