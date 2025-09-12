import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff181818),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 16.0,
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 21,
                    backgroundImage: AssetImage(
                      'assets/images/profile_avatar.png',
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Good Evening ,Muaz  ',
                            style: TextStyle(
                              color: Color(0xffFFFCFC),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'One task at a time.One step\ncloser.',
                            style: TextStyle(
                              color: Color(0xffC6C6C6),
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: Color(0xff282828),
                      fixedSize: Size(34, 34),
                    ),
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/images/sun.svg',
                      height: 18,
                      width: 18,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
