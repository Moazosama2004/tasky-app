import 'package:flutter/material.dart';
import 'package:tasky_app/core/widgets/custom_check_box.dart';
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
                  child: Container(
                    height: 56,
                    decoration: BoxDecoration(
                      color: Color(0xff282828),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 8),
                        CustomCheckBox(
                          value: tasks[index].isDone,
                          onChanged: (value) async {
                            onChanged(value, index);
                          },
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment:
                                MainAxisAlignment.center,
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                tasks[index].taskName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: tasks[index].isDone
                                      ? Color(0xffA0A0A0)
                                      : Color(0xffFFFCFC),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  decoration: tasks[index].isDone
                                      ? TextDecoration.lineThrough
                                      : null,
                                  decorationColor: Color(0xffA0A0A0),
                                ),
                              ),
                              if (tasks[index].taskDescription !=
                                  null)
                                Text(
                                  tasks[index].taskDescription!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Color(0xffC6C6C6),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_vert,
                            color: tasks[index].isDone
                                ? Color(0xffA0A0A0)
                                : Color(0xffFFFCFC),
                          ),
                        ),
                      ],
                    ),
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
