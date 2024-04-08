import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = 'SplashScreen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 10),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Container()),
          Expanded(child: Image.asset('assets/images/movies.png')),
          SizedBox(height: 50),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Route',
                  style: GoogleFonts.acme(
                    color: Color(0xffFFBB3B),
                  ),
                ),
                //style: TextStyle(color:Color(0xffFFBB3B))),
                Text(
                  'supervised by Mohamed Nabil',
                  style: GoogleFonts.poppins(
                    color: Color(0xffFFBB3B),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
