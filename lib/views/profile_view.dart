import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            'My Profile',
            style: TextStyle(
              color: Color(0xffFFFCFC),
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
