import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarahalgodah_lab12/View/EditInformation.dart';
import 'package:sarahalgodah_lab12/View/HomePage.dart';
import 'package:sarahalgodah_lab12/View/SignInPage.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/PhoneSign",
      getPages: [
        GetPage(name: "/HomePage", page: () => HomePage(),),
        GetPage(name: "/PhoneSign", page: () => PhoneSign(),),
        GetPage(name: "/EditInformation", page: () => EditInformation(),),
      ],
    );
  }
}
