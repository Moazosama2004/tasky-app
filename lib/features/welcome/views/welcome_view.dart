import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky_app/core/services/preferences_manager.dart';
import 'package:tasky_app/core/widgets/custom_button.dart';
import 'package:tasky_app/core/widgets/custom_svg_picture.dart';
import 'package:tasky_app/core/widgets/custom_text_form_field.dart';
import 'package:tasky_app/models/user_model.dart';
import 'package:tasky_app/features/home/views/home_view.dart';
import 'package:tasky_app/features/navigation/views/main_view.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // TODO DISPOSE CONTROLLERS
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomSvgPicture.withoutColorFilter(
                      path: 'assets/images/logo.svg',
                    ),
                    SizedBox(width: 16),
                    Text(
                      'Tasky',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ],
                ),
                SizedBox(height: 118),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome To Tasky ',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    CustomSvgPicture.withoutColorFilter(
                      path: 'assets/images/wave_hand.svg',
                      width: 28,
                      height: 28,
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  'Your productivity journey starts here.',
                  style: Theme.of(
                    context,
                  ).textTheme.displaySmall!.copyWith(fontSize: 16),
                ),
                SizedBox(height: 24),
                CustomSvgPicture.withoutColorFilter(
                  path: 'assets/images/welcome.svg',
                  width: 215,
                  height: 200,
                ),

                SizedBox(height: 28),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFormField(
                        title: 'Full Name',
                        hintText: 'e.g. Muaz Osama',
                        controller: nameController,
                        validator: (value) {
                          if (value?.trim().isEmpty ??
                              false || value == null) {
                            return 'Please Enter Your Full Name';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                CustomButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      await PreferencesManager().setBool(
                        'isVisited',
                        true,
                      );
                      UserModel userModel = UserModel(
                        username: nameController.text,
                      );
                      final userEncoded = jsonEncode(userModel.toJson());
                      await PreferencesManager().setString(
                        'userData',
                        userEncoded,
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainView(),
                        ),
                      );
                      nameController.clear();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please Enter Full Name.')),
                      );
                    }
                  },
                  label: 'Let’s Get Started',
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
