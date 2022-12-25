import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:salem_lab12/language/language.dart';
import 'package:salem_lab12/screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

Color lightgrey = const Color.fromARGB(255, 223, 223, 223);
Color myorange = const Color.fromARGB(255, 213, 87, 9);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Signin(),
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      supportedLocales: [Locale("en", "US"), Locale("ar", "SA")],
      fallbackLocale: Locale("ar", "SA"),
      translations: Languages(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
