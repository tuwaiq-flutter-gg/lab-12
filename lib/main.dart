import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:hadeel_lab12/Router/Router.dart';
import 'package:hadeel_lab12/controllers/userController.dart';
import 'firebase_options.dart';

void main() async {
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
    userController controller = Get.put(userController());
    String? userUID = FirebaseAuth.instance.currentUser?.uid;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: routerApp,
      initialRoute: userUID == null ? NameRoute.SignIn : NameRoute.Profie,
    );
  }
}
