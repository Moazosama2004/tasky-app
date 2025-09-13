import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky_app/models/task_model.dart';
import 'package:tasky_app/views/add_new_task_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String? username = '';
  List<TaskModel> tasks = [];
  bool isDone = false;

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    final prefs = await SharedPreferences.getInstance();
    username = prefs.getString('username');
    _loadTasks(prefs);
    setState(() {});
  }

  _loadTasks(SharedPreferences prefs) {
    if (prefs.getStringList('tasks')?.isNotEmpty ?? false) {
      for (String taskUncoded in prefs.getStringList('tasks')!) {
        final taskDecoded = jsonDecode(taskUncoded);
        tasks.add(TaskModel.fromJson(taskDecoded));
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff181818),

      floatingActionButton: SizedBox(
        height: 44,
        child: FloatingActionButton.extended(
          backgroundColor: Color(0xff15B86C),
          foregroundColor: Color(0xffFFFCFC),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(100),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddNewTaskView(),
              ),
            );
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

              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
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
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(width: 8),
                            Checkbox(
                              value: tasks[index].isDone,
                              onChanged: (value) async {
                                tasks[index].isDone = value ?? false;
                                setState(() {});
                                // TODO change in shared prefrences
                                final prefs =
                                    await SharedPreferences.getInstance();
                                final tasksEncoded = tasks
                                    .map(
                                      (e) => jsonEncode(e.toJson()),
                                    )
                                    .toList();
                                await prefs.setStringList(
                                  'tasks',
                                  tasksEncoded,
                                );
                              },
                              activeColor: Color(0xff15B86C),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadiusGeometry.circular(4),
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
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
                                      decorationColor: Color(
                                        0xffA0A0A0,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    tasks[index].taskDescription,
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
                            // Padding(
                            //   padding: const EdgeInsets.only(
                            //     right: 16,
                            //   ),
                            //   child: GestureDetector(
                            //     onTap: () {},
                            //     child: SvgPicture.asset(
                            //       'assets/images/details.svg',
                            //       height: 24,
                            //       width: 24,
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    );
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
