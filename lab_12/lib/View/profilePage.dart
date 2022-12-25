import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:lab_12/View/Componants/ImageProfil.dart';
import 'package:lab_12/View/Componants/bottomSheet.dart';
import 'package:lab_12/View/Componants/buttom.dart';
import 'package:lab_12/View/LoginPage.dart';
import 'package:lab_12/sivers/firebase/EmailPassword.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final firestor = FirebaseFirestore.instance;
    Stream<DocumentSnapshot<Map<String, dynamic>>> stemData =
        firestor.collection("info").doc("1").snapshots();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 210, 205, 205),
      appBar: AppBar(
        title: Text("My Information"),
        backgroundColor: Color.fromARGB(255, 255, 128, 0),
      ),
      body: Center(
        child: Column(children: [
          StreamBuilder(
              stream: stemData,
              builder: ((context, snapshot) {
                print(snapshot);
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text(" Loading ........");
                }
                if (snapshot.hasError) {
                  return Text("has Error.......");
                }

                if (snapshot.hasData == true) {
                  Map? userdata = snapshot.data!.data();
                  return Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      ImageProfile(),
                      Text(
                        "${userdata!['name']}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        printEmail(),
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 50),
                        width: Get.width - 20,
                        height: 300,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Who i am?",
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${userdata!['description']}",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ]),
                      ),
                    ],
                  );
                }
                return Text("nothing");
              })),
          ButtomStyle(
            onTap: () {
              bottomSheetEditMyInfo();
            },
            text: "edit My Information",
          ),
          SizedBox(
            height: 20,
          ),
          ButtomStyle(
            text: "Log Out",
            onTap: () {
              LogOut();
              Get.to(Login());
            },
          )
        ]),
      ),
    );
  }
}


//"My name is Asma Mohamed, I am 23 years old. I am looking forward to be a raft programmer. I learned a lot from Tuwaiq. Thank you Tuwaiq."