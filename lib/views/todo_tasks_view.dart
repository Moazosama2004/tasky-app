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
    final finalTask = prefs.getString('tasks');
    if (finalTask != null) {
      final taskAfterDecoded = jsonDecode(finalTask) as List<dynamic>;
      tasks = taskAfterDecoded
          .map((e) => TaskModel.fromJson(e))
          .where((e) => e.isDone == false)
          .toList();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            'To Do Tasks',
            style: TextStyle(
              color: Color(0xffFFFCFC),
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: TasksListViewBuilder(
              tasks: tasks,
              onChanged: (value, index) async {
                tasks[index!].isDone = value ?? false;
                final prefs = await SharedPreferences.getInstance();

                final fullTasks = prefs.getString('tasks');

                if (fullTasks != null) {
                  List<TaskModel> fullTasksList =
                      (jsonDecode(fullTasks) as List<dynamic>)
                          .map((e) => TaskModel.fromJson(e))
                          .toList();
                  final int comparingIndex = fullTasksList.indexWhere(
                    (e) => e.id == tasks[index].id,
                  );
                  fullTasksList[comparingIndex] = tasks[index];
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
        ),
      ],
    );
  }
}
