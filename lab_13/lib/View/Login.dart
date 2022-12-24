import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lab_13/Component/CustomButton.dart';
import 'package:lab_13/Component/CustomTextField.dart';
import 'package:lab_13/Servies/Login_S.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(
              child: Text(
            "Login",
            style: TextStyle(fontSize: 40),
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                CustomTextField(
                  controller: emailController,
                  hintTextShow: "example@example.com",
                  labelTextShow: "البريد الإلكتروني",
                  validaterMasseg: 'من فضلك ادخل الايميل',
                  keyboardType: TextInputType.emailAddress,
                  IconForText: Icons.email,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CustomTextField(
                  controller: passwordController,
                  hintTextShow: "*******",
                  labelTextShow: "كلمة المرور",
                  validaterMasseg: 'من فضلك ادخل الباسورد',
                  keyboardType: TextInputType.visiblePassword,
                  IconForText: Icons.lock_outline,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                filledButton(
                    title: "تسجيل الدخول",
                    radius: 5.0,
                    onPressed: () {
                      signInWithEmail(
                          email: emailController.text,
                          password: passwordController.text);
                    }),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "هل نسيت كلمة المرور؟",
                          style: TextStyle(
                              color: HexColor("#7660A9"),
                              fontWeight: FontWeight.bold),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "تسجيل جديد",
                          style: TextStyle(
                              color: HexColor("#7660A9"),
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0),
                        )),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
