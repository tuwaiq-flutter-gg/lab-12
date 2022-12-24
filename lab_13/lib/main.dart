import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_13/Servies/Services.dart';
import 'package:lab_13/View/Login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lab_13/View/Profile.dart';
import 'firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefs;

void main(List<String> args) async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
prefs = await SharedPreferences.getInstance();
  Start().onInit();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Profile(),
    );
  }
}
