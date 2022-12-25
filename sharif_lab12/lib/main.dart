// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharif_lab12/Firebase/FirebaseAuth.dart';
import 'package:sharif_lab12/firebase_options.dart';
import 'package:sharif_lab12/src/ProfileScreen.dart';
import 'package:sharif_lab12/src/SignInScreen.dart';

main() async {
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
      home: SignIn(),
      debugShowCheckedModeBanner: false,
    );
  }
}
