import 'package:flutter/material.dart';
import 'package:movies_app/screen/categories_screen.dart';
import 'package:movies_app/screen/home_screen.dart';
import 'package:movies_app/screen/splash_screen.dart';
import 'package:movies_app/styles/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.theme,
      initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName: (context) => SplashScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          CategoriesScreen.routeName :(context) => CategoriesScreen(),
        },
      debugShowCheckedModeBanner: false,
    );
  }
}