import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: Color(0xff181818),
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(primaryContainer: Color(0XFF282828)),
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

  textTheme: TextTheme(
    displaySmall: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 24,
      color: Color(0xffFFFCFC),
    ),
    displayMedium: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 28,
      color: Color(0xffFFFFFF),
    ),
    displayLarge: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 32,
      color: Color(0xffFFFCFC),
    ),
    titleSmall: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: Color(0xffC6C6C6),
    ),
    titleMedium: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: Color(0xffFFFCFC),
    ),

    titleLarge: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: Color(0xffA0A0A0),
      decorationColor: Color(0xff49454F),
      decoration: TextDecoration.lineThrough,
      overflow: TextOverflow.ellipsis,
    ),

    labelLarge: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 20,
      color: Color(0xffFFFCFC),
    ),
    labelMedium: TextStyle(color: Colors.white, fontSize: 16),
  ),

  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(
      color: Color(0xff6D6D6D),
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
    fillColor: Color(0xff282828),
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Color(0xff15B86C)),
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.circular(4),
    ),
  ),
);
