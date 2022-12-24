import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ruba_lab11/DectioaryLanguage/Dectionary.dart';
import 'package:ruba_lab11/Screen/Home.dart';
import 'package:ruba_lab11/Screen/SignIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';


SharedPreferences? prefs;

void main(List<String> args)async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      supportedLocales: [Locale("en", "US"), Locale("ar", "SA")],
      translations: Languages(),
      localizationsDelegates: const [
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
          home:prefs?.get("id") == null ? SignIn():Home(),
    );
  }
}