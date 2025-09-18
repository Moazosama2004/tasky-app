import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: Color(0xff181818),
  brightness: Brightness.dark,
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
    iconTheme: IconThemeData(color: Color(0xffFFFCFC)),
    titleTextStyle: TextStyle(
      color: Color(0xffFFFCFC),
      fontWeight: FontWeight.w400,
      fontSize: 20,
    ),
    centerTitle: true,
    elevation: 0.0,
    backgroundColor: Colors.transparent,
  ),
);
