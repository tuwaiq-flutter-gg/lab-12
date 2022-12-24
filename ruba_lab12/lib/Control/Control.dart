import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Control extends GetxController {
  
TextEditingController emailController = TextEditingController();
TextEditingController passwordController= TextEditingController();
TextEditingController updateEmailController= TextEditingController();
TextEditingController updateName = TextEditingController();
TextEditingController updateLastName = TextEditingController();
TextEditingController updateUniversity = TextEditingController();

  Rx<bool?> check = false.obs;
  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  // }
}

