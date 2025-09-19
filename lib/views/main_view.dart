import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky_app/core/theme/theme_controller.dart';
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
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        currentIndex: currentIndex,

        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/home.svg',
              colorFilter: ColorFilter.mode(
                ThemeController.isDark()
                    ? Color(0xffC6C6C6)
                    : Color(0xff3A4640),
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset('assets/images/home-active.svg'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/todo.svg',
              colorFilter: ColorFilter.mode(
                ThemeController.isDark()
                    ? Color(0xffC6C6C6)
                    : Color(0xff3A4640),
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset('assets/images/todo-active.svg'),
            label: 'To Do',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/completed.svg',
              colorFilter: ColorFilter.mode(
                ThemeController.isDark()
                    ? Color(0xffC6C6C6)
                    : Color(0xff3A4640),
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              'assets/images/completed-active.svg',
            ),
            label: 'Completed',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/profile.svg',
              colorFilter: ColorFilter.mode(
                ThemeController.isDark()
                    ? Color(0xffC6C6C6)
                    : Color(0xff3A4640),
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              'assets/images/profile-active.svg',
            ),
            label: 'Profile',
          ),
        ],
      ),
      body: SafeArea(child: views[currentIndex]),
    );
  }
}
