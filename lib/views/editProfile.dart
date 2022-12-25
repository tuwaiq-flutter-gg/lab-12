import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hadeel_lab12/Firebase/updateProfile.dart';
import 'package:hadeel_lab12/components/editProfileCard.dart';
import 'package:hadeel_lab12/components/primaryButton.dart';

import 'package:hadeel_lab12/constants/style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hadeel_lab12/controllers/userController.dart';

class editProfile extends StatelessWidget {
  const editProfile({super.key});

  @override
  Widget build(BuildContext context) {
    String? userUID = FirebaseAuth.instance.currentUser?.uid.toString();
    userController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          color: colors.Text,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Edit Profile",
          style: GoogleFonts.openSans(
            fontSize: 24,
            color: colors.Text,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: Get.height * 0.05,
          ),
          // Container(
          //   width: Get.width * 0.1,
          //   height: Get.height * 0.15,
          //   child: CircleAvatar(
          //     maxRadius: 50,
          //     child: ClipRRect(
          //         borderRadius: BorderRadius.circular(100),
          //         child: Image.asset(
          //           "images/pic5.jpeg",
          //           fit: BoxFit.fitWidth,
          //         )),
          //   ),
          // ),
          SizedBox(
            height: Get.height * 0.05,
          ),
          editProfileCard(
            title: "Name",
            icon: CupertinoIcons.person_fill,
            hint: "HADEEL",
            name: 'Name',
            enabled: true,
            controller: controller.nameController,
          ),
          SizedBox(
            height: Get.height * 0.04,
          ),
          editProfileCard(
            title: "Age",
            icon: IconData(0xe120, fontFamily: 'MaterialIcons'),
            hint: "22",
            name: 'Age',
            enabled: true,
            controller: controller.ageController,
          ),
          SizedBox(
            height: Get.height * 0.04,
          ),
          editProfileCard(
            title: "Email",
            icon: Icons.alternate_email_rounded,
            hint: "*****",
            name: 'Email',
            enabled: true,
            controller: controller.emailEditController,
          ),
          SizedBox(
            height: Get.height * 0.06,
          ),
          primaryButton(
            title: 'Save',
            onPressed: () {
              updateProfile(
                  email: controller.emailController.text,
                  name: controller.nameController!.text,
                  age: controller.ageController!.text,
                  UID: userUID);
            },
          ),
        ],
      ),
    );
  }
}
