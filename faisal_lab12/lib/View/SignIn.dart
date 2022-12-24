import 'package:faisal_lab12/Comp/button.dart';
import 'package:faisal_lab12/Comp/textfield.dart';
import 'package:faisal_lab12/Controller/AuthController.dart';
import 'package:faisal_lab12/View/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class SignIn extends StatelessWidget {
  SignIn({
    super.key,
  });

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
          button(
            title: "Sign In",
            onPressed: () {
              controller.SignIN();
            },
          ),
          button(
            title: "Go to Sign Up page",
            onPressed: () {
              controller.clearControllerText();
              Get.to(signup());
              //  controller.testfunction();
            },
          )
        ],
      ),
    );
  }
}
