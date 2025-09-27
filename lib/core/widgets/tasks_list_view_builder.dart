import 'package:flutter/material.dart';
import 'package:tasky_app/models/task_model.dart';
import 'package:tasky_app/core/widgets/tasks_list_view.dart';

class TasksListViewBuilder extends StatelessWidget {
  const TasksListViewBuilder({
    super.key,
    required this.tasks,
    required this.onChanged,
    required this.onDelete,
    required this.onUpdate,
  });
  final List<TaskModel> tasks;
  final Function(bool?, int?) onChanged;
  final Function(int) onDelete;
  final Function(bool) onUpdate;
  @override
  Widget build(BuildContext context) {
    return tasks.isNotEmpty
        ? TasksListView(
            onUpdate: onUpdate,
            tasks: tasks,
            onChanged: onChanged,
            onDelete: onDelete,
          )
        : Center(
            child: Text(
              'No Data',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          );
  }
}
