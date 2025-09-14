import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky_app/models/task_model.dart';
import 'package:tasky_app/widgets/tasks_list_view_builder.dart';

class TodoTasksView extends StatefulWidget {
  const TodoTasksView({super.key});

  @override
  State<TodoTasksView> createState() => _TodoTasksViewState();
}

class _TodoTasksViewState extends State<TodoTasksView> {
  List<TaskModel> tasks = [];
  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final finalTask = prefs.getStringList('tasks');
    if (finalTask != null) {
      tasks = finalTask.map((e) {
        return TaskModel.fromJson(jsonDecode(e));
      }).toList();
      tasks = tasks.where((e) => e.isDone == false).toList();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('To Do Tasks')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: TasksListViewBuilder(
          tasks: tasks,
          onChanged: (value, index) async {
            tasks[index!].isDone = value ?? false;
            final prefs = await SharedPreferences.getInstance();
            setState(() {});
            final tasksEncoded = tasks
                .map((e) => jsonEncode(e.toJson()))
                .toList();
            await prefs.setStringList('tasks', tasksEncoded);
            _loadTasks();
          },
        ),
      ),
    );
  }
}
