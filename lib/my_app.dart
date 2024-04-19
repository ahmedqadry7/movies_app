
import 'package:flutter/material.dart';
import 'package:movies_app/screen/category_movies_screen.dart';
import 'package:movies_app/screen/home_screen.dart';
import 'package:movies_app/screen/movie_details_screen.dart';
import 'package:movies_app/screen/splash_screen.dart';
import 'package:movies_app/styles/themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.theme,
      initialRoute: SplashScreen.routeName,
      routes: {
        //RecommendedMovieDetails.routeName :(context) => RecommendedMovieDetails(),
        MovieDetailsScreen.routeName:(context) => MovieDetailsScreen(),
        SplashScreen.routeName: (context) => SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        CategoryMoviesDetails.routeName: (context) => CategoryMoviesDetails(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
