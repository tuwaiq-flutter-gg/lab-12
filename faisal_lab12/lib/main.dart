import 'package:faisal_lab12/Controller/AuthController.dart';
import 'package:faisal_lab12/View/SignIn.dart';
import 'package:faisal_lab12/View/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  runApp(MyApp());
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // home: signup(),
      home: SignIn(),
    );
  }
}
