import 'package:flutter/material.dart';
import 'package:tasky_app/core/widgets/custom_check_box.dart';
import 'package:tasky_app/core/widgets/task_item.dart';
import 'package:tasky_app/models/task_model.dart';

class TasksListView extends StatelessWidget {
  const TasksListView({
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
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 56),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: TaskItem(
            onUpdate: onUpdate,
            onDelete: onDelete,
            task: tasks[index],
            onChanged: (bool? value) {
              onChanged(value, index);
            },
          ),
        );
      },
    );
  }
}
