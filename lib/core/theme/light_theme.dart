import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: Color(0xffF6F7F9),
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(primaryContainer: Color(0XFFFFFFFF)),
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

    displayLarge: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 32,
      color: Color(0xff161F1B),
    ),
    titleSmall: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: Color(0xff3A4640),
    ),
    titleMedium: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: Color(0xff161F1B),
    ),

    titleLarge: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: Color(0xff6A6A6A),
      decorationColor: Color(0xff49454F),
      decoration: TextDecoration.lineThrough,
      overflow: TextOverflow.ellipsis,
    ),

    labelMedium: TextStyle(color: Colors.black, fontSize: 16),
    labelLarge: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 20,
      color: Color(0xff161F1B),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(
      color: Color(0xff9E9E9E),
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
    fillColor: Color(0xffFFFFFF),
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Color(0xffD1DAD6)),
      // borderSide: BorderSide.none,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Color(0xffD1DAD6)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Color(0xffD1DAD6)),
      // borderSide: BorderSide(color: Color(0xff15B86C)),
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.circular(4),
    ),
    side: BorderSide(color: Color(0xffD1DAD6), width: 2),
  ),
);
