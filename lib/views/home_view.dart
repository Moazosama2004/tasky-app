import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky_app/core/services/preferences_manager.dart';
import 'package:tasky_app/models/task_model.dart';
import 'package:tasky_app/models/user_model.dart';
import 'package:tasky_app/views/add_new_task_view.dart';
import 'package:tasky_app/core/widgets/archieved_tasks.dart';
import 'package:tasky_app/core/widgets/high_priority_tasks.dart';
import 'package:tasky_app/core/widgets/sliver_list_view_tasks_builder.dart';
import 'package:tasky_app/core/widgets/tasks_list_view_builder.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  UserModel? userModel;
  List<TaskModel> tasks = [];
  bool isDone = false;
  int totalTasks = 0;
  int doneTasks = 0;
  double percentage = 0;
  // List<TaskModel> highPriorityTasks = [];

  @override
  void initState() {
    super.initState();
    _loadUserData();
    _loadTasks();
  }

  Future<void> _loadUserData() async {
    final userData = PreferencesManager().getString('userData');
    userModel = UserModel.fromJson(jsonDecode(userData!));
    setState(() {});
  }

  _loadTasks() async {
    final finalTask = PreferencesManager().getString('tasks');
    if (finalTask != null) {
      final taskAfterDecoded = jsonDecode(finalTask) as List<dynamic>;
      tasks = taskAfterDecoded.map((e) => TaskModel.fromJson(e)).toList();
      _calcPercentage();

      setState(() {});
    }
  }

  void _calcPercentage() {
    totalTasks = tasks.length;
    doneTasks = tasks.where((e) => e.isDone == true).toList().length;
    percentage = totalTasks == 0 ? 0 : doneTasks / totalTasks;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 44,
        child: FloatingActionButton.extended(
          backgroundColor: Color(0xff15B86C),
          foregroundColor: Color(0xffFFFCFC),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(100),
          ),
          onPressed: () async {
            final bool? result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddNewTaskView()),
            );
            if (result != null && result) {
              _loadTasks();
            }
          },
          label: Text('Add New Task'),
          icon: Icon(Icons.add, color: Color(0xffFFFCFC)),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 16.0,
          ),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 21,
                          backgroundImage: AssetImage(
                            'assets/images/profile_avatar.png',
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Good Evening ,${userModel?.username}',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium,
                                ),
                                Text(
                                  '${userModel?.motivationQuote}',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleSmall,
                                ),
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: Color(0xff282828),
                            fixedSize: Size(34, 34),
                          ),
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/images/sun.svg',
                            height: 18,
                            width: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Yuhuu ,Your work Is',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        Row(
                          children: [
                            Text(
                              'almost done ! ',
                              style: Theme.of(
                                context,
                              ).textTheme.displayLarge,
                            ),
                            SvgPicture.asset(
                              'assets/images/wave_hand.svg',
                              width: 32,
                              height: 32,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    ArchievedTasks(
                      doneTasks: doneTasks,
                      totalTasks: totalTasks,
                      percentage: percentage,
                    ),
                    SizedBox(height: 8),
                    HighPriorityTasks(
                      tasks: tasks,
                      onChanged: (value, index) {
                        _checkBoxDoneTask(index, value);
                      },
                      refresh: () {
                        _loadTasks();
                      },
                    ),
                    SizedBox(height: 24),
                    Text(
                      'My Tasks',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
              SliverListViewTasksBuilder(
                tasks: tasks,
                onChanged: (value, index) {
                  _checkBoxDoneTask(index, value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _checkBoxDoneTask(int? index, bool? value) async {
    tasks[index!].isDone = value ?? false;
    _calcPercentage();
    setState(() {});
    final tasksJson = tasks.map((e) => e.toJson()).toList();
    final tasksEncoded = jsonEncode(tasksJson);
    await PreferencesManager().setString('tasks', tasksEncoded);
  }
}
