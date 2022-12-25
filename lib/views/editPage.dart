import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rakan_lab12/controllers/userControllers.dart';

class EditPage extends StatelessWidget {
  EditPage({super.key});
  UserController userController = Get.find();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit info"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: "new Name",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0.5,
                    color: Colors.black38,
                  ),
                ),
              ),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: "new Email",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0.5,
                    color: Colors.black38,
                  ),
                ),
              ),
            ),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(
                hintText: "new Age",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0.5,
                    color: Colors.black38,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                FirebaseFirestore.instance
                    .collection("users")
                    .doc(userController.mainUser.uid)
                    .update(
                  {
                    "name": nameController.text,
                    "age": ageController.text,
                    "email": emailController.text,
                  },
                );
                userController.mainUser.name = nameController.text;
                userController.mainUser.age = ageController.text;
                userController.mainUser.email = emailController.text;

                userController.update();
                Get.back();
              },
              child: Text("Update"),
            ),
          ],
        ),
      ),
    );
  }
}
