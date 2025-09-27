import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tasky_app/core/enums/task_item_actions_enum.dart';
import 'package:tasky_app/core/services/preferences_manager.dart';
import 'package:tasky_app/core/theme/theme_controller.dart';
import 'package:tasky_app/core/widgets/custom_button.dart';
import 'package:tasky_app/core/widgets/custom_check_box.dart';
import 'package:tasky_app/core/widgets/custom_text_form_field.dart';
import 'package:tasky_app/models/task_model.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.task,
    required this.onChanged,
    required this.onDelete,
    required this.onUpdate,
  });

  final TaskModel task;
  final Function(bool?)? onChanged;
  final Function(int) onDelete;
  final Function(bool) onUpdate;

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

                  // TODO : CHANGE STATUS OR TEXT
                  onChanged!(!task.isDone);

                case TaskItemActionsEnum.edit:
                  final result = await _showModalBottomSheet(context);
                  onUpdate(result ?? false);
                  log('result => $result');
                case TaskItemActionsEnum.delete:
                  await _showDeleteDialog(context);
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

  Future<bool?> _showModalBottomSheet(BuildContext context) async {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController taskNameController = TextEditingController(
      text: task.taskName,
    );
    TextEditingController taskDescriptionController =
        TextEditingController(text: task.taskDescription);

    bool isHighPriority = task.isHighPriority;
    return await showModalBottomSheet<bool?>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Container(
                    height: 5,
                    width: 50,
                    // alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(500),
                      color: Color(0xff6D6D6D).withAlpha(100),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                CustomTextFormField(
                  title: 'Task Name',
                  hintText: 'Finish UI design for login screen',
                  controller: taskNameController,
                  validator: (value) {
                    if (value?.trim().isEmpty ?? false || value == null) {
                      return 'Please Enter Task Name';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20.0),
                CustomTextFormField(
                  title: 'Task Description',
                  hintText:
                      'Finish onboarding UI and hand off to devs by Thursday.',
                  controller: taskDescriptionController,
                  validator: (value) {
                    if (value?.trim().isEmpty ?? false || value == null) {
                      return 'Please Enter Task Name';
                    } else {
                      return null;
                    }
                  },
                  maxLines: 5,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'High Priority',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Switch(
                      value: isHighPriority,
                      onChanged: (value) {
                        isHighPriority = value;
                        setState(() {});
                      },
                    ),
                  ],
                ),
                Spacer(),
                CustomButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      task.taskName = taskNameController.text;
                      task.taskDescription =
                          taskDescriptionController.text;
                      task.isHighPriority = isHighPriority;
                      await _editTask(taskModel: task);
                      Navigator.pop(context, true);
                    }
                  },
                  label: 'Edit Task',
                  icon: Icon(Icons.edit),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _editTask({required TaskModel taskModel}) async {
    final allTasks = PreferencesManager().getString('tasks');
    if (allTasks != null) {
      //  1 - get tasks
      List<TaskModel> fullTasksList =
          (jsonDecode(allTasks) as List<dynamic>)
              .map((e) => TaskModel.fromJson(e))
              .toList();
      log('edit tasks before ${fullTasksList.toString()}');
      // 2 - edit task
      // 2 - edit (استبدال العنصر)
      final taskIndex =
          fullTasksList.indexWhere((e) => e.id == taskModel.id);
      if (taskIndex != -1) {
        fullTasksList[taskIndex] = taskModel;
      }
      // 3 - set it
      log('edit tasks after ${fullTasksList.toString()}');
      await PreferencesManager().setString('tasks',
          jsonEncode((fullTasksList).map((e) => e.toJson()).toList()));
    }
  }

  Future<dynamic> _showDeleteDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Task'),
        content: Text('Are you sure you want to delete this task '),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              onDelete(task.id);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text('Delete'),
          ),
        ],
      ),
    );
  }
}
