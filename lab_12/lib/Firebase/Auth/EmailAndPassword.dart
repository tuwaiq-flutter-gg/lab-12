


import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../Pages/HomePage.dart';

SigninEmailPassword(
    {required String emailAddress, required String password}) async {
  try {
    var user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailAddress, password: password);
    if (user.user!.uid != null) {
      Get.to(() => HomePage());
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}