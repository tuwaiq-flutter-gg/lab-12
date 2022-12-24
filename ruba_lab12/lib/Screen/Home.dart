import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ruba_lab11/Component/TextFiled.dart';
import 'package:ruba_lab11/Component/button.dart';
import 'package:ruba_lab11/Control/Control.dart';
import 'package:ruba_lab11/Screen/Edit.dart';
import 'package:ruba_lab11/Screen/SignIn.dart';
import 'package:ruba_lab11/Service/Firebase/Auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
   Home({super.key});
   Control Controller = Get.put(Control());
final user = FirebaseAuth.instance.currentUser;
List<Map<String,dynamic>> dataFromFirebase=[];
final info= FirebaseFirestore.instance;
Stream<DocumentSnapshot<Map<String, dynamic>>> userStream =FirebaseFirestore.instance.collection("information").doc("sJLWHvJ1lwbdMglFSbMI").snapshots();
  Future<DocumentSnapshot<Map<String, dynamic>>> geDataFromFirebace() async{
    return await FirebaseFirestore.instance.collection("information").doc("sJLWHvJ1lwbdMglFSbMI").get();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
          children: [SizedBox(height: 70,),
          Center(child: Text("A11".tr,style: TextStyle(fontSize: 30,),)),
          SizedBox(height: 30,),
           StreamBuilder<DocumentSnapshot<Map<String, dynamic>>> (stream: userStream, 
    builder: (context, snapshot) {
      if (snapshot.connectionState== ConnectionState.waiting){
        return Text("Lodaing...................");
      }
      if (snapshot.hasError){
        return Text("Error...................");
      }
  
      if (snapshot.hasData==true){///// اعرض البيانات فقط بدون الكي  حقها 
        Map? userdata;
       userdata= snapshot.data!.data() as Map; 
        return 
        Column(children: [
          Text(userdata["name"]),
          Text(userdata["lastName"]),
          Text(userdata["University"]),         
          ]);
  }
      return Text("nothing");
    }),


            // Text("Cureent Email: ${user!.email!}"),
            // SizedBox(height: 15,),
            // Text("ID: ${user!.uid}"),
            // SizedBox(height: 15,),
            // Text("Creation Day: ${user!.metadata.creationTime}"),
            // SizedBox(height: 50,),
            // SizedBox(height: 40,),
            // Button(title: "A10".tr,onPressed: () {
            //   Get.to(edit());
              //  UpdateEmail();
            //   Controller.update();
            // },),
            SizedBox(height: 40,),
            Button(title: "A10".tr,onPressed: () {
              Get.to(edit()); },
              ),
              SizedBox(height: 40,),
            Button(title: "A4".tr,onPressed: () {
              Get.offAll(SignIn());
              FirebaseAuth.instance.signOut();
            },),
          ],
        ),
      ),
    );
  }
}