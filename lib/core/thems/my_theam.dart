import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/constant.dart';
class MyThemData {
  static ThemeData lightThem = ThemeData(
    scaffoldBackgroundColor: const Color(0xffFFFFFF),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      elevation: 0,
      backgroundColor: Color(0xffF0F0F0),
    ),
    colorScheme: const ColorScheme(
      primary: Color(0xFF5D9CEC),
      brightness: Brightness.light,
      onPrimary: Colors.white,
      secondary: Color(0xFF5D9CEC),
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.white10,
      background: Colors.black,
      onBackground: Colors.transparent,
      onSurface: Colors.white10,
      surface: Colors.transparent,
    ).copyWith(background: const Color(0xffDFECDB)),
  );

  static ThemeData darkTheam = ThemeData(
    scaffoldBackgroundColor: scoundColor,
    appBarTheme: const AppBarTheme(
      toolbarHeight: 100,
      color: Color(0xff4083D9),
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      elevation: 0,
      backgroundColor: scoundColor,
    ),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Color(0xff5D9CEC)),
    colorScheme: ColorScheme(
      primary: Colors.grey.shade300,
      brightness: Brightness.dark,
      onPrimary: Colors.black,
      secondary: Colors.grey.shade300,
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.white10,
      background: Colors.transparent,
      onBackground: Colors.transparent,
      onSurface: Colors.white10,
      surface: Colors.transparent,
    ).copyWith(background: scoundColor),
  );
}
