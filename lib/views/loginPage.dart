import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rakan_lab12/components/MainTextField.dart';
import 'package:rakan_lab12/controllers/userControllers.dart';
import 'package:rakan_lab12/model/user.dart';
import 'package:rakan_lab12/services/auth.dart';
import 'package:rakan_lab12/views/profilePage.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Column(
        children: [
          MainTextField(
            hintText: "Email",
            controller: emailController,
          ),
          MainTextField(
            hintText: "Password",
            controller: passwordController,
          ),
          ElevatedButton(
            onPressed: () async {
              var email = emailController.text;
              var pass = passwordController.text;
              var userUid = await signInWithEmail(email: email, password: pass);
              if (userUid != null) {
                var userData = await FirebaseFirestore.instance
                    .collection("users")
                    .doc(userUid)
                    .get();

                Get.put(
                  UserController(mainUser: User.fromJson(userData.data()!)),
                );
                Get.offAll(ProfilePage());
              }
            },
            child: Text("Login"),
          ),
        ],
      ),
    );
  }
}
