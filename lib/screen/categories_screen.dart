import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  static const String routeName = "CategoriesScreen";
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
      ),
    );
  }
}