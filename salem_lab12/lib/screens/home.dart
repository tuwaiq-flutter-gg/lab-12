import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salem_lab12/components/bbar.dart';
import 'package:salem_lab12/components/spacing.dart';
import 'package:salem_lab12/components/txtf.dart';
import 'package:salem_lab12/controller/mycontroller.dart';
import 'package:salem_lab12/main.dart';
import 'package:salem_lab12/screens/login.dart';
import 'package:salem_lab12/services/auth.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// Hi
class _HomePageState extends State<HomePage> {
  MyDataController dataController = Get.put(MyDataController());
  @override
  @override
  Widget build(BuildContext context) {
    String? usrID = auth.currentUser?.uid.toString();
    Map tt;
    String name1 = "";
    String age1 = "";
    String email = "";

    getData() async {
      var document =
          await FirebaseFirestore.instance.collection("profile").doc(usrID);
      document.get().then((document) {
        print(document.data() as Map);
        tt = document.data() as Map;
        name1 = tt["Name"];
        age1 = tt["Age"];
        email = tt["Email"];
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: myorange,
      ),
      body: GetBuilder<MyDataController>(builder: (_) {
        dataController.update();
        return Column(
          children: [
            Spacing(height: 30),
            //name
            Text(
              name1,
              style: TextStyle(color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Txtf(
                  hint: name,
                  arTxt: dataController.arTxt,
                  contr: dataController.nametxt),
            ),
            Spacing(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Txtf(
                  hint: age,
                  arTxt: dataController.arTxt,
                  contr: dataController.agetxt),
            ),
            Spacing(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Txtf(
                  hint: auth.currentUser!.email.toString(),
                  arTxt: dataController.arTxt,
                  contr: dataController.newEmail),
            ),
            Spacing(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: InkWell(
                onTap: () {
                  setState(() {});
                  if (dataController.nametxt.text.isEmpty) {
                    print("nameage");
                  } else {
                    updateName();
                  }
                  if (dataController.newEmail.text.isEmpty) {
                    print("email");
                  } else {
                    resetEmail();
                  }
                  if (dataController.agetxt.text.isEmpty) {
                    print("name");
                  } else {
                    updateAge();
                  }
                },
                child: Bbar(
                    bname: "Update Profile",
                    textcolor: Colors.white,
                    bcolor: myorange),
              ),
            )
          ],
        );
      }),
    );
  }
}
