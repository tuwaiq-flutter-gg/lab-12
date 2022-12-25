// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharif_lab12/Firebase/FireStore.dart';
import 'package:sharif_lab12/Firebase/FirebaseAuth.dart';

class ProfileController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController age = TextEditingController();

  userInfo() async {
    String? userId = Auth.getUserId();
    if (userId != null) {
      var profileInfo = await FireStore.getProfileInfo(id: userId);
      if (profileInfo != null) {
        name.text = profileInfo.get("name");
        email.text = profileInfo["email"];
        age.text = profileInfo["age"];
      }
    }
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    await userInfo();
  }
}
