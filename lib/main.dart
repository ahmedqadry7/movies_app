import 'package:flutter/material.dart';
import 'package:movies_app/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'network/remote/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
