import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:rakan_lab12/controllers/userControllers.dart';
import 'package:rakan_lab12/views/editPage.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  UserController userController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(EditPage());
            },
            icon: Icon(Icons.edit),
          )
        ],
      ),
      body: Center(
        child: GetBuilder<UserController>(
          builder: (_) => Column(
            children: [
              Text(userController.mainUser.name!),
              Text(userController.mainUser.email!),
              Text(userController.mainUser.age!),
            ],
          ),
        ),
      ),
    );
  }
}
