import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:ruba_lab11/Component/TextFiled.dart';
import 'package:ruba_lab11/Component/button.dart';
import 'package:ruba_lab11/Screen/Home.dart';
import 'package:ruba_lab11/Screen/SignIn.dart';
import 'package:ruba_lab11/Service/Firebase/Auth.dart';

class edit extends StatelessWidget {
   edit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 100,),
          // TextFileded(
          //    controller: controller1,
          //       decoration: InputDecoration(
          //         hintText: "Name",
          //       ),

          // ),

          //  TextField(
          //           controller: updateName,
          //             decoration: InputDecoration(
          //             hintText: "Name"
          //             ),
          //           ),
          //            TextField(
          //           controller: updateLastName,
          //             decoration: InputDecoration(
          //             hintText: "LastName"
          //             ),
          //           ),
          TextFileded(title: "Name".tr,controller1:Controller.updateName, scureText: false),
          TextFileded(title: "Last Name".tr,controller1:Controller.updateLastName, scureText: false),
          TextFileded(title: "University".tr,controller1:Controller.updateUniversity, scureText: false),
           SizedBox(height: 40,),
              Button(title: "update".tr,onPressed: ()async {
                //print("Test---------------------------");
                 updatingProfile(
                    name: Controller.updateName.text, lastName: Controller.updateLastName.text, University: Controller.updateUniversity.text);
                //print("Test------test-------------test--------");
              },),
       
                  
      
        ]),
      ),
    );
  }
}
