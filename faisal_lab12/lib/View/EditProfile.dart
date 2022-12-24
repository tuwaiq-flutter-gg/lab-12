import 'package:faisal_lab12/Comp/button.dart';
import 'package:faisal_lab12/Comp/textfield.dart';
import 'package:faisal_lab12/Controller/AuthController.dart';
import 'package:faisal_lab12/View/ViewProfile.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Editprofile extends StatelessWidget {
  Editprofile({
    super.key,
  });

  AuthController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        SizedBox(
          height: 50,
        ),
        Center(
          child: Text("Enter Email"),
        ),
        textfield(co: controller.emailco, Title: "Email"),
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
          title: "Save Changes",
          onPressed: () {
            controller.updateProfile();
            Get.to(viewprofile());
          },
        ),
        SizedBox(
          height: 50,
        ),
        button(
            title: "SignOut",
            onPressed: () {
              controller.SignOut();
            }),
      ]),
    );
  }
}
