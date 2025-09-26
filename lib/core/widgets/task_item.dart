import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tasky_app/core/enums/task_item_actions_enum.dart';
import 'package:tasky_app/core/services/preferences_manager.dart';
import 'package:tasky_app/core/theme/theme_controller.dart';
import 'package:tasky_app/core/widgets/custom_check_box.dart';
import 'package:tasky_app/models/task_model.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.task,
    required this.onChanged,
    required this.onDelete,
  });

  final TaskModel task;
  final Function(bool?)? onChanged;
  final Function(int) onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: ThemeController.isDark()
              ? Colors.transparent
              : Color(0xffD1DAD6),
        ),
      ),
      child: Row(
        children: [
          SizedBox(width: 8),
          CustomCheckBox(value: task.isDone, onChanged: onChanged),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.taskName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: task.isDone
                      ? Theme.of(context).textTheme.titleLarge
                      : Theme.of(context).textTheme.titleMedium,
                ),
                if (task.taskDescription != null)
                  Text(
                    task.taskDescription!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
              ],
            ),
          ),
          PopupMenuButton<TaskItemActionsEnum>(
            icon: Icon(
              Icons.more_vert,
              color: ThemeController.isDark()
                  ? (task.isDone ? Color(0xffA0A0A0) : Color(0xffFFFCFC))
                  : (task.isDone ? Color(0xff6A6A6A) : Color(0xff3A4640)),
            ),
            onSelected: (TaskItemActionsEnum? value) async {
              switch (value) {
                case TaskItemActionsEnum.markAsDone:
                  {
                    // TODO : CHANGE STATUS OR TEXT
                    onChanged!(!task.isDone);
                    print('$value , markAsDone');
                    break;
                  }
                case TaskItemActionsEnum.edit:
                  print('$value , edit');
                  break;

                case TaskItemActionsEnum.delete:
                  onDelete(task.id);
                  print('$value , delete');
                  break;
                default:
                  print('Something Wrong..');
              }
            },
            itemBuilder: (context) => TaskItemActionsEnum.values
                .map(
                  (e) => PopupMenuItem(
                    value: e,
                    child: Text(e.name, style: TextStyle(fontSize: 16)),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
