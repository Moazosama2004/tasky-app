import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: Color(0xffF6F7F9),
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primaryContainer: Color(0XFFFFFFFF),
    secondary: Color(0XFF161F1B),
  ),
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
    labelSmall: TextStyle(
      color: Color(0xff161F1B),
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    labelMedium: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 20,
      color: Color(0xff161F1B),
    ),

    labelLarge: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 24,
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
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(Color(0xff15B86C)),
      foregroundColor: WidgetStateProperty.all(Color(0xffFFFCFC)),
      textStyle: WidgetStateProperty.all(
        TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: Color(0xffffffff),
        ),
      ),
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color(0xff15B86C),
    foregroundColor: Color(0xffFFFCFC),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.circular(100),
    ),
    extendedTextStyle: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: Color(0xffffffff),
    ),
  ),

  listTileTheme: ListTileThemeData(
    contentPadding: EdgeInsets.zero,
    titleTextStyle: TextStyle(
      color: Color(0xff161F1B),
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ),
  dividerTheme: DividerThemeData(color: Color(0xFFCAC4D0)),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Color(0xff15B86C),
    selectionHandleColor: Color(0xff15B86C),
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 0.0,
    backgroundColor: Color(0xffF6F7F9),
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Color(0xff15B86C),
    unselectedItemColor: Color(0xff3A4640),
    selectedLabelStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
  ),
  splashFactory: NoSplash.splashFactory,

  popupMenuTheme: PopupMenuThemeData(
    color: Color(0xffF6F7F9),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.circular(16),
    ),
    shadowColor: Color(0xff15B86C),
    elevation: 2,
    labelTextStyle: WidgetStateProperty.all(
      TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
    ),
  ),
);
