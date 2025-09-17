import 'package:flutter/material.dart';
import 'package:tasky_app/core/widgets/custom_button.dart';
import 'package:tasky_app/core/widgets/custom_text_form_field.dart';

class UserDetailsView extends StatefulWidget {
  const UserDetailsView({super.key});

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
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                title: 'Motivation Quote',
                hintText: 'One task at a time. One step closer.',
                controller: quoteController,
                maxLines: 5,
              ),
              Spacer(),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {}
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
