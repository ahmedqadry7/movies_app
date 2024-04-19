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
      Duration(seconds: 5),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen(),
        ),
      ),
    );
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
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Your Movie Adventure Starts Here..',style: GoogleFonts.akatab(
                  color: Color(0xffFFBB3B),
                  fontSize: 18,
                  fontWeight: FontWeight.w700),),
                  // Text('Eng Mayar Taha Mohamed \n Eng Ahmed Qadry Taha',style: GoogleFonts.akatab(
                  // color: Color(0xffFFBB3B),
                  // fontSize: 20,
                  // fontWeight: FontWeight.w700),),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
