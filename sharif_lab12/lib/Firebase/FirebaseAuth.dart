// ignore_for_file: library_prefixes, file_names, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sharif_lab12/src/SignInScreen.dart';

abstract class Auth {
  static final FirebaseAuth instance = FirebaseAuth.instance;

  static String? getUserId() {
    try {
      if (instance.currentUser != null) {
        return instance.currentUser?.uid;
      }
    } on FirebaseAuthException catch (error) {
      Get.snackbar(
        "Get User ID Error",
        "${error.message}",
        duration: Duration(seconds: 10),
      );
    }
    return null;
  }

  static signOut() async {
    try {
      await instance.signOut();
      Get.to(SignIn());
    } on FirebaseAuthException catch (error) {
      Get.snackbar(
        "sign Out Error",
        "${error.message}",
        duration: Duration(seconds: 10),
      );
    }
  }

  static emailSignUp({required String email, required String password}) async {
    try {
      await instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (error) {
      Get.snackbar(
        "sign Up Error",
        "${error.message}",
        duration: Duration(seconds: 10),
      );
    }
    return false;
  }

  static emailSignIn({required String email, required String password}) async {
    try {
      await instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (error) {
      Get.snackbar(
        "sign In Error",
        "${error.message}",
        duration: Duration(seconds: 10),
      );
    }
    return false;
  }
}
