// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharif_lab12/Components/Button.dart';
import 'package:sharif_lab12/Components/NumbersField.dart';
import 'package:sharif_lab12/Components/TextField.dart';
import 'package:sharif_lab12/Controllers/ProfileController.dart';
import 'package:sharif_lab12/Firebase/FireStore.dart';
import 'package:sharif_lab12/Firebase/FirebaseAuth.dart';
import 'package:sharif_lab12/src/SignInScreen.dart';

class Profile extends StatelessWidget {
  ProfileController profileController = Get.find();
  final _formName = GlobalKey<FormState>();
  final _formEmail = GlobalKey<FormState>();
  final _formAge = GlobalKey<FormState>();

  Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Screen"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Auth.signOut();
              Get.offAll(SignIn());
            },
            icon: Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(25),
        children: [
          CustomTextField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "${"Name"} is Empty";
              } else {
                return null;
              }
            },
            formKey: _formName,
            title: "Name",
            controller: profileController.name,
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
            controller: profileController.email,
          ),
          CustomNumbersField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "${"Age"} is Empty";
              } else {
                return null;
              }
            },
            formKey: _formAge,
            title: "Age",
            controller: profileController.age,
          ),
          CustomButton(
            title: 'Update Profile Info',
            press: () async {
              var validEmail = _formEmail.currentState!.validate();
              var validName = _formName.currentState!.validate();
              var validAge = _formAge.currentState!.validate();
              if (validEmail && validName && validAge) {
                await FireStore.setProfileInfo(
                  name: profileController.name.text,
                  email: profileController.email.text,
                  age: profileController.age.text,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
