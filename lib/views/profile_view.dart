import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky_app/core/services/preferences_manager.dart';
import 'package:tasky_app/core/theme/theme_controller.dart';
import 'package:tasky_app/core/widgets/custom_svg_picture.dart';
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
                                _showModalBottomSheet(context);
                              },
                              child: CircleAvatar(
                                radius: 17,
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.primaryContainer,
                                child: CustomSvgPicture(
                                  path: 'assets/images/camera.svg',
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
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                      Text(
                        userModel?.motivationQuote ?? '',
                        style: Theme.of(context).textTheme.titleSmall,
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
                      style: Theme.of(context).textTheme.labelMedium,
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
                      leading: CustomSvgPicture(
                        path: 'assets/images/profile.svg',
                      ),
                      trailing: Icon(
                        Icons.arrow_forward,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      title: Text('User Details'),
                    ),
                    SizedBox(width: 16),
                    Divider(),
                    ListTile(
                      leading: CustomSvgPicture(
                        path: 'assets/images/moon.svg',
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
                      title: Text('Dark Mode'),
                    ),
                    SizedBox(width: 16),
                    Divider(),
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
                      leading: CustomSvgPicture(
                        path: 'assets/images/logout.svg',
                      ),
                      trailing: Icon(
                        Icons.arrow_forward,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      title: Text('Log Out'),
                    ),
                  ],
                ),
              ],
            ),
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.75,
              minHeight: 50),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 40,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
