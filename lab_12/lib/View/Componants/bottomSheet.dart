import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:lab_12/View/Componants/TextFildStily.dart';
import 'package:lab_12/View/Componants/buttom.dart';
import 'package:lab_12/View/LoginPage.dart';
import 'package:lab_12/View/profilePage.dart';
import 'package:lab_12/sivers/firebase/EmailPassword.dart';

TextEditingController? controllerEmail = TextEditingController();
TextEditingController? controllerName = TextEditingController();
TextEditingController? controllerDer = TextEditingController();

bottomSheetEditMyInfo() {
  Get.bottomSheet(
    Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          color: Colors.white,
        ),
        height: Get.height / 1.5,
        child: Padding(
          padding: const EdgeInsets.all(35),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "edit name",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 255, 128, 0)),
              ),
              TextFildStyle(
                controller: controllerName,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "edit Email",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 255, 128, 0)),
              ),
              TextFildStyle(
                controller: controllerEmail,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "edit Information",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 255, 128, 0)),
              ),
              TextFildStyle(
                controller: controllerDer,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.center,
                width: Get.width,
                child: Column(
                  children: [
                    ButtomStyle(
                      text: "Edit",
                      onTap: () {
                        var firestor = FirebaseFirestore.instance;
                        firestor
                            .collection('info')
                            .doc("1")
                            .update({'name': controllerName!.text});

                        updateEmail(UEmail: controllerEmail!.text);
                        firestor
                            .collection('info')
                            .doc("1")
                            .update({'description': controllerDer!.text});

                        // firestor.collection('info').doc("1").update({'name': "a"});
                      },
                    ),
                   
                  ],
                ),
              ),
            ],
          ),
        )),
    backgroundColor: Colors.transparent,
  );
}
