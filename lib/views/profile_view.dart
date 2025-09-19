import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky_app/core/services/preferences_manager.dart';
import 'package:tasky_app/core/theme/theme_controller.dart';
import 'package:tasky_app/main.dart';
import 'package:tasky_app/models/user_model.dart';
import 'package:tasky_app/views/user_details_view.dart';
import 'package:tasky_app/views/welcome_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  UserModel? userModel;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final userData = PreferencesManager().getString('userData');
    userModel = UserModel.fromJson(jsonDecode(userData!));
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: isLoading
          ? Center(
              child: CircularProgressIndicator(color: Color(0xff15B86C)),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    'My Profile',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 42.5,
                            backgroundImage: AssetImage(
                              'assets/images/profile_avatar.png',
                            ),
                          ),

                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: GestureDetector(
                              onTap: () {
                                log('CLICKED');
                              },
                              child: CircleAvatar(
                                radius: 17,
                                backgroundColor: Color(0xff282828),
                                child: SvgPicture.asset(
                                  'assets/images/camera.svg',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          userModel?.username ?? '',
                          style: TextStyle(
                            color: Color(0xffFFFCFC),
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Text(
                        userModel?.motivationQuote ?? '',
                        style: TextStyle(
                          color: Color(0xffC6C6C6),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Profile Info',
                      style: TextStyle(
                        color: Color(0xffFFFCFC),
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 8),
                    ListTile(
                      onTap: () async {
                        final bool result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                UserDetailsView(userModel: userModel!),
                          ),
                        );
                        log('result => $result');

                        if (result || result != null) {
                          _loadUserData();
                        }
                      },
                      contentPadding: EdgeInsets.zero,
                      leading: SvgPicture.asset(
                        'assets/images/profile.svg',
                        colorFilter: ColorFilter.mode(
                          Color(0xffFFFCFC),
                          BlendMode.srcIn,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Color(0xffC6C6C6),
                        ),
                      ),
                      title: Text(
                        'User Details',
                        style: TextStyle(
                          color: Color(0xffFFFCFC),
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Divider(color: Color(0xff6E6E6E)),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: SvgPicture.asset(
                        'assets/images/moon.svg',
                        colorFilter: ColorFilter.mode(
                          Color(0xffFFFCFC),
                          BlendMode.srcIn,
                        ),
                      ),
                      trailing: ValueListenableBuilder<ThemeMode>(
                        valueListenable: ThemeController.themeNotifier,
                        builder: (context, value, child) {
                          return Switch(
                            value: value == ThemeMode.dark,
                            onChanged: (value) async {
                              ThemeController.toggleTheme();
                            },
                          );
                        },
                      ),
                      title: Text(
                        'Dark Mode',
                        style: TextStyle(
                          color: Color(0xffFFFCFC),
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Divider(color: Color(0xff6E6E6E)),
                    ListTile(
                      onTap: () async {
                        PreferencesManager().remove('userData');
                        PreferencesManager().remove('tasks');
                        PreferencesManager().setBool('isVisited', false);
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WelcomeView(),
                          ),
                          (route) => false,
                        );
                      },
                      contentPadding: EdgeInsets.zero,
                      leading: SvgPicture.asset(
                        'assets/images/logout.svg',
                        colorFilter: ColorFilter.mode(
                          Color(0xffFFFCFC),
                          BlendMode.srcIn,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Color(0xffC6C6C6),
                        ),
                      ),
                      title: Text(
                        'Log Out',
                        style: TextStyle(
                          color: Color(0xffFFFCFC),
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
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
