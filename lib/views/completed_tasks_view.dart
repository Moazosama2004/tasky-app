import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky_app/core/services/preferences_manager.dart';
import 'package:tasky_app/models/task_model.dart';
import 'package:tasky_app/core/widgets/tasks_list_view_builder.dart';

class CompletedTasksView extends StatefulWidget {
  const CompletedTasksView({super.key});

  @override
  State<CompletedTasksView> createState() =>
      _CompletedTasksViewState();
}

class _CompletedTasksViewState extends State<CompletedTasksView> {
  List<TaskModel> tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  _loadTasks() async {
    final finalTask = PreferencesManager().getString('tasks');
    if (finalTask != null) {
      final taskAfterDecoded = jsonDecode(finalTask) as List<dynamic>;
      tasks = taskAfterDecoded
          .map((e) => TaskModel.fromJson(e))
          .where((e) => e.isDone == true)
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
            'Completed Tasks',
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

                final fullTasks = PreferencesManager().getString(
                  'tasks',
                );

                if (fullTasks != null) {
                  List<TaskModel> fullTasksList =
                      (jsonDecode(fullTasks) as List<dynamic>)
                          .map((e) => TaskModel.fromJson(e))
                          .toList();
                  final int comparingIndex = fullTasksList.indexWhere(
                    (e) => e.id == tasks[index].id,
                  );
                  fullTasksList[comparingIndex] = tasks[index];
                  await PreferencesManager().setString(
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
