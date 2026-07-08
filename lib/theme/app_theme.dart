import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xffF8F9FC),

    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xff2248C7),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
    ),

    fontFamily: 'Roboto',
  );
}