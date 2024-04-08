import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
            height: 50,
            width: 200,
            child: Lottie.network(
                "https://lottie.host/19e350a3-71fb-41e6-af52-a69cac311867/rvj70SfJEh.json")),
        centerTitle: true,
      ),
    );
  }
}