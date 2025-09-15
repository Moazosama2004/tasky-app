import 'package:flutter/material.dart';
import 'package:tasky_app/models/task_model.dart';

class HighPriorityTasks extends StatelessWidget {
  const HighPriorityTasks({
    super.key,
    required this.tasks,
    required this.onChanged,
  });
  final List<TaskModel> tasks;
  final Function(bool? value, int? index) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 176,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0XFF282828),
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
                    ...tasks
                        .where((e) => e.isHighPriority)
                        .take(4)
                        .map((element) {
                          return Row(
                            children: [
                              Checkbox(
                                value: element.isDone,
                                onChanged: (value) {
                                  final int index = tasks.indexWhere(
                                    (e) => e.id == element.id,
                                  );
                                  onChanged(value, index);
                                },
                                activeColor: Color(0xff15B86C),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadiusGeometry.circular(
                                        4,
                                      ),
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  element.taskName,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: element.isDone
                                        ? Color(0xffA0A0A0)
                                        : Color(0xffFFFCFC),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    decoration: element.isDone
                                        ? TextDecoration.lineThrough
                                        : null,
                                    decorationColor: Color(
                                      0xffA0A0A0,
                                    ),
                                  ),
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
                    backgroundColor: Color(0xff282828),
                    child: IconButton(
                      onPressed: () {},
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
