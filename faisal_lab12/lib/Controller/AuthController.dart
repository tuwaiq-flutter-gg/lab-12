import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faisal_lab12/FireBase/Auth.dart';
import 'package:faisal_lab12/View/SignIn.dart';
import 'package:faisal_lab12/View/ViewProfile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController emailco = TextEditingController();
  TextEditingController passco = TextEditingController();
  TextEditingController nameco = TextEditingController();
  TextEditingController cityco = TextEditingController();
  TextEditingController ageco = TextEditingController();

  // Stream<QuerySnapshot> UserStream =
  //     FirebaseFirestore.instance.collection("Users").snapshots();

  SignUp() async {
    await SignUpMethod(
        emailAddress: emailco.text,
        password: passco.text,
        age: ageco.text,
        city: cityco.text,
        name: nameco.text);
    await SignInMethod(emailAddress: emailco.text, password: passco.text);
    await SetProfile(
        age: ageco.text,
        city: cityco.text,
        email: emailco.text,
        name: nameco.text);
    clearControllerText();
    await GetData();

    Get.to(viewprofile());
  }

  SignIN() async {
    await SignInMethod(emailAddress: emailco.text, password: passco.text);
    clearControllerText();
    await GetData();

    Get.to(viewprofile());
  }

  clearControllerText() {
    emailco.clear();
    nameco.clear();
    passco.clear();
    cityco.clear();
    ageco.clear();
  }

  updateProfile() async {
    await UpdateProfile(
        age: ageco.text,
        city: cityco.text,
        email: emailco.text,
        name: nameco.text);
    await GetData();
    update();
  }

  SignOut() async {
    await SignOutMethod();
    clearControllerText();
    Get.offAll(SignIn());
  }

  testfunction() async {
    await checkusers();
  }

  var data;
  GetData() async {
    var x = await getProfile();
    data = x;
    nameco.text = data["Name"];
    ageco.text = data["Age"];
    cityco.text = data["City"];
    emailco.text = data["Email"];
  }
}
