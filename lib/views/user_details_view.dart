import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky_app/core/services/preferences_manager.dart';
import 'package:tasky_app/core/widgets/custom_button.dart';
import 'package:tasky_app/core/widgets/custom_text_form_field.dart';
import 'package:tasky_app/models/user_model.dart';

class UserDetailsView extends StatefulWidget {
  const UserDetailsView({super.key, required this.userModel});
  final UserModel userModel;

  @override
  State<UserDetailsView> createState() => _UserDetailsViewState();
}

class _UserDetailsViewState extends State<UserDetailsView> {
  final TextEditingController userNameContoller =
      TextEditingController();
  final TextEditingController quoteController =
      TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    userNameContoller.text = widget.userModel.username;
    quoteController.text = widget.userModel.motivationQuote;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Details')),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8,
        ),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextFormField(
                title: 'User Name',
                hintText: 'Muaz Osama',
                controller: userNameContoller,
                validator: (value) {
                  if (value?.trim().isEmpty ??
                      false || value == null) {
                    return 'Please Enter Your name Correctly.';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                title: 'Motivation Quote',
                hintText: 'One task at a time. One step closer.',
                controller: quoteController,
                maxLines: 5,
                validator: (value) {
                  if (value?.trim().isEmpty ??
                      false || value == null) {
                    return 'Please Enter Your Motivation Quote.';
                  } else {
                    return null;
                  }
                },
              ),
              Spacer(),
              CustomButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    final newUserData = jsonEncode(
                      UserModel(
                        username: userNameContoller.text,
                        motivationQuote: quoteController.text,
                      ).toJson(),
                    );
                    await PreferencesManager().setString(
                      'userData',
                      newUserData,
                    );
                    Navigator.pop(context, true);
                    // Todo : focus on navigate
                  }
                },
                label: 'Save Changes',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
