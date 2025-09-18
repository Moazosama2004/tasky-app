import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tasky_app/core/widgets/custom_check_box.dart';
import 'package:tasky_app/models/task_model.dart';
import 'package:tasky_app/views/high_priority_view.dart';

class HighPriorityTasks extends StatelessWidget {
  const HighPriorityTasks({
    super.key,
    required this.tasks,
    required this.onChanged,
    required this.refresh,
  });
  final List<TaskModel> tasks;
  final Function(bool? value, int? index) onChanged;
  final Function refresh;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 176,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              'High Priority Tasks',
              style: TextStyle(
                color: Color(0xff15B86C),
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  children: [
                    ...tasks.reversed
                        .where((e) => e.isHighPriority)
                        .take(4)
                        .map((element) {
                          return Row(
                            children: [
                              CustomCheckBox(
                                value: element.isDone,
                                onChanged: (value) {
                                  final int index = tasks.indexWhere(
                                    (e) => e.id == element.id,
                                  );
                                  onChanged(value, index);
                                },
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  element.taskName,
                                  maxLines: 1,

                                  style: element.isDone
                                      ? Theme.of(
                                          context,
                                        ).textTheme.titleLarge
                                      : Theme.of(
                                          context,
                                        ).textTheme.titleMedium,
                                ),
                              ),
                            ],
                          );
                        }),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                  vertical: 8,
                ),
                child: CircleAvatar(
                  backgroundColor: Color(0xff6E6E6E),
                  radius: 20,
                  child: CircleAvatar(
                    radius: 19,
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.primaryContainer,
                    child: IconButton(
                      onPressed: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HighPriorityView(),
                          ),
                        );
                        log(" result => $result");
                        refresh();
                      },
                      icon: Icon(
                        Icons.arrow_outward,
                        color: Color(0xffC6C6C6),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
