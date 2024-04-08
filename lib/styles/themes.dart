import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      unselectedLabelStyle: TextStyle(fontFamily: "a"),
      selectedLabelStyle: TextStyle(fontFamily: "a"),
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.white,
      enableFeedback: false,
      backgroundColor: Colors.transparent,
      unselectedIconTheme: IconThemeData(size: 32),
      selectedIconTheme: IconThemeData(size: 32),
      selectedItemColor: Color(0xffFFB224),
    ),
    primaryColor: Color(0xff1A1A1A),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.black,
      secondary: Color(0xffFFB224),
    ),
    useMaterial3: true,
  );
}
