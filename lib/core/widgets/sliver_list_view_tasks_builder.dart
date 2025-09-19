import 'package:flutter/material.dart';
import 'package:tasky_app/core/widgets/custom_check_box.dart';
import 'package:tasky_app/core/widgets/task_item.dart';
import 'package:tasky_app/models/task_model.dart';

class SliverListViewTasksBuilder extends StatelessWidget {
  const SliverListViewTasksBuilder({
    super.key,
    required this.tasks,
    required this.onChanged,
  });

  final List<TaskModel> tasks;
  final Function(bool?, int?) onChanged;

  @override
  Widget build(BuildContext context) {
    return tasks.isNotEmpty
        ? SliverPadding(
            padding: const EdgeInsets.only(bottom: 60),
            sliver: SliverList.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: TaskItem(
                    task: tasks[index],
                    onChanged: (value) {
                      onChanged(value, index);
                    },
                  ),
                );
              },
            ),
          )
        : SliverToBoxAdapter(
            child: Center(
              child: Text(
                'No Data',
                style: TextStyle(
                  color: Color(0xffFFFCFC),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          );
  }
}
