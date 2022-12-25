import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hadeel_lab12/Firebase/SigningIn.dart';
import 'package:hadeel_lab12/Router/Router.dart';
import 'package:hadeel_lab12/components/customTextField.dart';
import 'package:hadeel_lab12/components/primaryButton.dart';
import 'package:hadeel_lab12/constants/style.dart';
import 'package:hadeel_lab12/controllers/userController.dart';
import 'package:hadeel_lab12/views/Profile.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    userController controller = Get.find();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: Get.height * 0.05,
            ),
          ),
          customTextField(
            name: "Email",
            isPass: false,
            prefixIcon: Icon(
              Icons.alternate_email_rounded,
              size: 18,
              color: colors.icons,
            ),
            keyboardType: TextInputType.emailAddress,
            hint: "Enter your email",
            controller: controller.emailController,
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          customTextField(
            name: "Password",
            prefixIcon: Icon(
              CupertinoIcons.lock_fill,
              size: 18,
              color: colors.icons,
            ),
            isPass: true,
            keyboardType: TextInputType.visiblePassword,
            hint: "Enter your password",
            controller: controller.PassController,
          ),
          SizedBox(
            height: Get.height * 0.05,
          ),
          primaryButton(
            title: 'Sign In',
            onPressed: () async {
              await FirebaseAuth.instance
                  .fetchSignInMethodsForEmail(controller.emailController.text)
                  .then(((value) {
                if (value.length == 0) {
                  var user = createUserAccount(
                      email: controller.emailController.text,
                      password: controller.PassController.text);
                } else
                  var user = signInWithEmail(
                      email: controller.emailController.text,
                      password: controller.PassController.text);
              }));

              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => Profile())));
            },
          ),
        ],
      ),
    );
  }
}
