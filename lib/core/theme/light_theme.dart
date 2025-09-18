import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: Color(0xffF6F7F9),
  brightness: Brightness.light,
  switchTheme: SwitchThemeData(
    trackColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Color(0xff15B86C);
      }
      return Colors.white;
    }),
    thumbColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.white;
      }
      return Colors.grey;
    }),
    trackOutlineColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.transparent;
      }
      return Colors.grey;
    }),
    trackOutlineWidth: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return 0;
      }
      return 2;
    }),
  ),
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: Color(0xff161F1B)),
    titleTextStyle: TextStyle(
      color: Color(0xff161F1B),
      fontWeight: FontWeight.w400,
      fontSize: 20,
    ),
    centerTitle: true,
    elevation: 0.0,
    backgroundColor: Colors.transparent,
  ),
  textTheme: TextTheme(
    displayMedium: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 28,
      color: Color(0xff161F1B),
    ),
    displaySmall: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 24,
      color: Color(0xff161F1B),
    ),
  ),
);
