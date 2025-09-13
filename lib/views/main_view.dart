import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky_app/views/completed_tasks_view.dart';
import 'package:tasky_app/views/home_view.dart';
import 'package:tasky_app/views/profile_view.dart';
import 'package:tasky_app/views/todo_tasks_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;

  final List<Widget> views = [
    HomeView(),
    TodoTasksView(),
    CompletedTasksView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff181818),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        currentIndex: currentIndex,
        backgroundColor: Color(0xff181818),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xff15B86C),
        unselectedItemColor: Color(0xffC6C6C6),
        selectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/home.svg'),
            activeIcon: SvgPicture.asset(
              'assets/images/home-active.svg',
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/todo.svg'),
            activeIcon: SvgPicture.asset(
              'assets/images/todo-active.svg',
            ),
            label: 'To Do',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/completed.svg'),
            activeIcon: SvgPicture.asset(
              'assets/images/completed-active.svg',
            ),
            label: 'Completed',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/profile.svg'),
            activeIcon: SvgPicture.asset(
              'assets/images/profile-active.svg',
            ),
            label: 'Profile',
          ),
        ],
      ),
      body: views[currentIndex],
    );
  }
}
