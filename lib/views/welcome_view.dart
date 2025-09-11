import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                SvgPicture.asset(
                  'assets/images/logo.svg',
                  width: 42,
                  height: 42,
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
                SvgPicture.asset(
                  'assets/images/wave_hand.svg',
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
            SvgPicture.asset(
              'assets/images/welcome.svg',
              width: 215,
              height: 200,
            ),
            SizedBox(height: 28),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff15B86C),
                foregroundColor: Color(0xffFFFCFC),
                fixedSize: Size(343, 40),
              ),
              onPressed: () {},
              child: Text(
                'Let’s Get Started',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
