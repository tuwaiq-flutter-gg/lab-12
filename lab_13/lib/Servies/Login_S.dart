import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_13/View/Login.dart';
import 'package:lab_13/View/Profile.dart';
import 'package:lab_13/main.dart';

var instance = FirebaseAuth.instance;
signInWithEmail({required String email, required String password}) async {
  try {
    var auth = FirebaseAuth.instance;
    var user = await auth.signInWithEmailAndPassword(
        email: email, password: password);

    if (user.user?.uid != null) {
      Get.to(() =>Profile());
    }
  } on FirebaseAuthException catch (error) {
    print(error.code);
    if (error.code == "wrong-password") {
      Get.snackbar("wrong", "Email or password is wrong");
    } else if (error.code == "network-request-failed") {
      Get.snackbar("wrong", "check your connections");
    }
  }
}

anonymouslyLogin() async {
  try {
    var auth = FirebaseAuth.instance;
    var user = await auth.signInAnonymously();
    print("Users Sign in ");
    print(user.user?.uid.toString());
  } catch (error) {
    print(error);
  }
}

updateUserEmail({required TextEditingController enteredEmail}) {
  try {
    var auth = FirebaseAuth.instance;
    final user = auth.currentUser?.updateEmail(enteredEmail.text);
    Get.snackbar("Done", "hhhh");
  } catch (error) {
    print(error);
  }
}

funcSignout() async {
  try {
    var auth = FirebaseAuth.instance;
    await auth.signOut();
    await prefs?.clear();
    Get.offAll(() => Login());

    print("Users is Sign Out ");
  } catch (error) {
    print(error);
  }
}

getID() {
  return instance.currentUser?.uid;
}

getEmail() {
  return instance.currentUser?.email;
}

getDay() {
  return instance.currentUser?.metadata.creationTime.toString();
}

LoginWithPhone({required String phoneNumber, Function(String)? idSMS}) async {
  try {
    FirebaseAuth auth = FirebaseAuth.instance;
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) {
       idSMS!(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  } catch (erorr) {
    print(erorr);
  }
}


