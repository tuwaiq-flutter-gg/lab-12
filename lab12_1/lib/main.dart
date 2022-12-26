import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:lab12_1/Firebase/anonymouslySignin.dart';
import 'package:lab12_1/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefs;

void main() async 
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
);

anonymouslySignin();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home:HomePage(),
    );
  }
}


// ListView(
//     //   children:     
//     //   // )
//     //   Text("fff")
//     //   // // textfilds( titlee: "Mohammad"),
//     //   //  CustomeImages="images/noodle.png",
    
//     // ))