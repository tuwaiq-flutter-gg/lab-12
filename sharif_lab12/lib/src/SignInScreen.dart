// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, file_names

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharif_lab12/Components/Button.dart';
import 'package:sharif_lab12/Components/TextField.dart';
import 'package:sharif_lab12/Controllers/ProfileController.dart';
import 'package:sharif_lab12/Firebase/FirebaseAuth.dart';
import 'package:sharif_lab12/src/ProfileScreen.dart';
import 'package:sharif_lab12/src/SignUpScreen.dart';

class SignIn extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final TapGestureRecognizer gestRec = TapGestureRecognizer()
    ..onTap = () {
      Get.to(SignUp());
    };
  final _formEmail = GlobalKey<FormState>();
  final _formPassword = GlobalKey<FormState>();

  SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In Screen"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20, left: 7, top: 100),
                    child: Row(
                      children: [
                        Text(
                          "Sign In Screen",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomTextField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "${"Email"} is Empty";
                      } else {
                        return null;
                      }
                    },
                    formKey: _formEmail,
                    title: "Email",
                    controller: email,
                  ),
                  CustomTextField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "${"Password"} is Empty";
                      } else {
                        return null;
                      }
                    },
                    formKey: _formPassword,
                    title: "Password",
                    controller: password,
                  ),
                  CustomButton(
                    title: 'Sign In',
                    press: () async {
                      var validEmail = _formEmail.currentState!.validate();
                      var validPassword =
                          _formPassword.currentState!.validate();
                      if (validEmail && validPassword) {
                        var auth = await Auth.emailSignIn(
                            email: email.text, password: password.text);
                        if (auth == true) {
                          ProfileController profileController =
                              Get.put(ProfileController());
                          Get.off(Profile());
                        }
                      }
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: "New Here? ",
                            children: [
                              TextSpan(
                                text: "Sign Up",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: gestRec,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
