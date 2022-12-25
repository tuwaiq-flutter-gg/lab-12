import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:lab_12/View/LoginPage.dart';
import 'package:lab_12/View/profilePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Login(),
    );
  }
}
