import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lab_13/Component/CustomButton.dart';
import 'package:lab_13/Component/CustomTextField.dart';
import 'package:lab_13/Servies/Login_S.dart';

var data = FirebaseFirestore.instance;

class Profile extends StatelessWidget {
  Profile({super.key, this.name});
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final AgeController = TextEditingController();
  final Address = TextEditingController();
  final String? name;
  getdata() async {
    var userInfo = await data.collection('User').doc("1").get();
    print(userInfo.data());
    userInfo.data();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Text(
                  "Your Id: ${getID()}",
                  style: TextStyle(fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CustomTextField(
                    controller: emailController,
                    hintTextShow: "example@example.com",
                    labelTextShow: getEmail(),
                    validaterMasseg: 'من فضلك ادخل الايميل',
                    keyboardType: TextInputType.emailAddress,
                    IconForText: Icons.email,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CustomTextField(
                    controller: nameController,
                    hintTextShow: "عطنا اسمك تقدر تحدثه معليك😁",
                    labelTextShow: "اسمك يا وحش",
                    validaterMasseg: 'من فضلك ادخل اسمك',
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CustomTextField(
                    controller: AgeController,
                    hintTextShow: "عطنا عمرك  اذا زاد حدثه",
                    labelTextShow: "عمرك",
                    validaterMasseg: 'من فضلك ادخل عمرك',
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CustomTextField(
                    controller: Address,
                    hintTextShow: "عطنا عنوانك تقدر تحدثه معليك😁",
                    labelTextShow: "عنوانك",
                    validaterMasseg: 'من فضلك ادخل عنوانك',
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: filledButton(
                      title: "عدل وارسل وازهل الباقي",
                      radius: 5.0,
                      onPressed: () async {
                        updateName() {
                          data
                              .collection("User")
                              .doc("1")
                              .update({'name': nameController.text});
                        }

                        updateAge() {
                          data
                              .collection("User")
                              .doc("1")
                              .update({'Age': AgeController.text});
                        }

                        updateAddres() {
                          data
                              .collection("User")
                              .doc("1")
                              .update({'Addres': Address.text});
                        }

                        updateAddres();
                        updateName();
                        updateAge();
                        updateUserEmail(enteredEmail: emailController);
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
