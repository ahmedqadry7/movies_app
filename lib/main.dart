import 'package:flutter/material.dart';
import 'package:movies_app/screen/category_movies_screen.dart';
import 'package:movies_app/screen/home_screen.dart';
import 'package:movies_app/screen/splash_screen.dart';
import 'package:movies_app/styles/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        CategoryMoviesDetails.routeName: (context) => CategoryMoviesDetails(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
