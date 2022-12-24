import 'dart:ffi';

import 'package:faisal_lab12/Comp/button.dart';
import 'package:faisal_lab12/Comp/textfield.dart';
import 'package:faisal_lab12/Controller/AuthController.dart';
import 'package:faisal_lab12/View/EditProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class viewprofile extends StatelessWidget {
  viewprofile({
    super.key,
  });

  AuthController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<AuthController>(builder: (context) {
      return ListView(
        children: [
          SizedBox(
            height: 50,
          ),
          Center(
            child: Text("Your Email     " + controller.data["Email"]),
          ),
          SizedBox(
            height: 25,
          ),
          Center(
            child: Text("Your Name     " + controller.data["Name"]),
          ),
          SizedBox(
            height: 25,
          ),
          Center(
            child: Text("Your Age     " + controller.data["Age"]),
          ),
          SizedBox(
            height: 25,
          ),
          Center(
            child: Text("Your city      " + controller.data["City"]),
          ),
          SizedBox(
            height: 25,
          ),
          button(
              title: "To Edit click here",
              onPressed: () {
                Get.to(Editprofile());
              }),
          SizedBox(
            height: 100,
          ),
          button(
              title: "SignOut",
              onPressed: () {
                controller.SignOut();
              }),
        ],
      );
    }));
  }
}
