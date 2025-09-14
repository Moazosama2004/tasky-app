import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky_app/models/task_model.dart';
import 'package:tasky_app/views/add_new_task_view.dart';
import 'package:tasky_app/widgets/tasks_list_view_builder.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String? username = '';
  List<TaskModel> tasks = [];
  bool isDone = false;
  int totalTasks = 0;
  int doneTasks = 0;
  double percentage = 0;

  @override
  void initState() {
    super.initState();
    _loadUserName();
    _loadTasks();
  }

  Future<void> _loadUserName() async {
    final prefs = await SharedPreferences.getInstance();
    username = prefs.getString('username');
    setState(() {});
  }

  _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final finalTask = prefs.getString('tasks');
    if (finalTask != null) {
      final taskAfterDecoded = jsonDecode(finalTask) as List<dynamic>;
      tasks = taskAfterDecoded
          .map((e) => TaskModel.fromJson(e))
          .toList();

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
              MaterialPageRoute(
                builder: (context) => AddNewTaskView(),
              ),
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
                            'Good Evening ,$username',
                            style: TextStyle(
                              color: Color(0xffFFFCFC),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'One task at a time.One step\ncloser.',
                            style: TextStyle(
                              color: Color(0xffC6C6C6),
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
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
                    style: TextStyle(
                      color: Color(0xffFFFCFC),
                      fontWeight: FontWeight.w400,
                      fontSize: 32,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'almost done ! ',
                        style: TextStyle(
                          color: Color(0xffFFFCFC),
                          fontWeight: FontWeight.w400,
                          fontSize: 32,
                        ),
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
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0XFF282828),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(16),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Achieved Tasks',
                          style: TextStyle(
                            color: Color(0xffFFFCFC),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '$doneTasks Out of $totalTasks Done',
                          style: TextStyle(
                            color: Color(0xffC6C6C6),
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Text(
                          '${(percentage * 100).toInt()}%',
                          style: TextStyle(
                            color: Color(0xffFFFCFC),
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        Transform.rotate(
                          angle: -pi / 2,
                          child: SizedBox(
                            height: 48,
                            width: 48,
                            child: CircularProgressIndicator(
                              value: percentage,
                              strokeWidth: 4,
                              strokeCap: StrokeCap.round,
                              // strokeAlign: 4,
                              backgroundColor: Color(0xff6d6d6d),
                              semanticsValue: '2',
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(
                                    Color(0xff15B86C),
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Expanded(
                child: TasksListViewBuilder(
                  tasks: tasks,
                  onChanged: (value, index) async {
                    tasks[index!].isDone = value ?? false;
                    _calcPercentage();
                    final prefs =
                        await SharedPreferences.getInstance();
                    setState(() {});
                    final tasksJson = tasks
                        .map((e) => e.toJson())
                        .toList();
                    final tasksEncoded = jsonEncode(tasksJson);
                    await prefs.setString('tasks', tasksEncoded);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
