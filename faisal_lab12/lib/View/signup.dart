import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faisal_lab12/Comp/button.dart';
import 'package:faisal_lab12/Comp/textfield.dart';
import 'package:faisal_lab12/Controller/AuthController.dart';
import 'package:faisal_lab12/FireBase/Auth.dart';
import 'package:faisal_lab12/View/SignIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class signup extends StatelessWidget {
  signup({super.key});

  AuthController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Text("Enter Email"),
          ),
          textfield(co: controller.emailco, Title: "Email"),
          Center(
            child: Text("Enter Password"),
          ),
          textfield(co: controller.passco, Title: "Password"),
          Center(
            child: Text("Enter Name"),
          ),
          textfield(co: controller.nameco, Title: "Name"),
          Center(
            child: Text("Enter Age"),
          ),
          textfield(co: controller.ageco, Title: "Age"),
          Center(
            child: Text("Enter city"),
          ),
          textfield(co: controller.cityco, Title: "city"),
          button(
            title: "SignUp",
            onPressed: () async {
              // controller.SetProfile();
              controller.SignUp();
            },
          ),
          SizedBox(
            height: 25,
          ),
          button(
            title: "Go to Sign In page",
            onPressed: () {
              controller.clearControllerText();
              Get.to(SignIn());
            },
          ),
        ],
      ),
    );
  }
}
