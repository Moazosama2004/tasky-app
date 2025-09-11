import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff181818),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 42,
                  width: 42,
                ),
                SizedBox(width: 16),
                Text(
                  'Tasky',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 28,
                    color: Color(0xffFFFFFF),
                  ),
                ),
              ],
            ),

            SizedBox(height: 118),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome To Tasky ',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                    color: Color(0xffFFFCFC),
                  ),
                ),
                Image.asset(
                  'assets/images/wave.png',
                  width: 28,
                  height: 28,
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'Your productivity journey starts here.',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xffFFFCFC),
              ),
            ),
            SizedBox(height: 24),
            Image.asset(
              'assets/images/welocme.png',
              width: 215,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
