import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab12_1/buttons.dart';
import 'package:lab12_1/signup.dart';
import 'package:lab12_1/texts.dart';


class signinPage extends StatefulWidget {
  
 signinPage({super.key});
  List<Map<String,dynamic>> datafromfirestore=[];

  @override
  State<signinPage> createState() => _signinPageState();
}

class _signinPageState extends State<signinPage> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final usernameController = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      toolbarHeight: 22,
    ),
     body: 
ListView(
  children: [
    SizedBox(height: 12,),
    Container(
      padding:EdgeInsets.all(11) ,
     height: Get.mediaQuery.size.height/4,
    width:  Get.mediaQuery.size.width,
    decoration: BoxDecoration(borderRadius:BorderRadius.circular(33)),
child: Image.asset("images/apple-hero-757.png",fit: BoxFit.cover,),
    ),
    const SizedBox(height: 10,),
      const textTitle(texTitle: "Sign in"),
      textfilds( titlee: "Username", controller: usernameController,),
      textfilds(titlee: "Password",passAsStars: true,controller: passController,),
    buttons(buttonCaption: "sing in",pageOff: "homeMenue",),
       
      
       ElevatedButton(onPressed: (){
        var firestore = FirebaseFirestore.instance;
            firestore
            .collection("1")
            .doc("D1")
            .set({"s1": "sss1"});

            //  AddUser("Nama", "Lineclass", 35);

        }, child: const Text("Add to firestore"),),



         ElevatedButton(onPressed: () async{
         var firestore = FirebaseFirestore.instance;
         await firestore.collection("1").get().then(((value) {
          value.docs.map((docmants) => print(docmants.data())).toList();
          return null;
        }));
       }, child: const Text("Git Data from firestore"),),
         Padding(
           padding: const EdgeInsets.only(left: 150),
           child: 
           InkWell(child: const textNormal(textnormal: "Forgot Password?\n\f\r\r\r\r               sign Up",),          
          onTap: () async {
            Get.to(signUpPage());
          }),
         )
     ]),
  );
 }
}