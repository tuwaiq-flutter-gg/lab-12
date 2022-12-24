import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarahalgodah_lab12/Service/Auth_Phone.dart';
import 'package:sarahalgodah_lab12/View/HomePage.dart';

class PhoneSign extends StatelessWidget {
  PhoneSign({super.key});
  TextEditingController? controllerPhone = TextEditingController();
  TextEditingController? controllerCode = TextEditingController();
  var idms; //Id For SMS
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: Get.height,
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    TextField(
                      controller: controllerPhone,
                      decoration: InputDecoration(hintText: "Phone"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[900],
                        ),
                        onPressed: () async {
                          await sginInWithPhoneNumber(
                              phone: "+966" + controllerPhone!.text,
                              db: (v) {
                                idms = v;
                              });
                        },
                        child: Text("Sgin In")),
                  ],
                ),

                //Code
                Column(
                  //Entry Point
                  children: [
                    TextField(
                      controller: controllerCode,
                      decoration: InputDecoration(hintText: "Code"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[900]),
                        onPressed: () async {
                          var user = await FirebaseAuth.instance
                              .signInWithCredential(
                                  PhoneAuthProvider.credential(
                                      verificationId: idms,
                                      smsCode: controllerCode!.text));
                          if (user.user?.uid != null) {
                            Get.offAll(() => HomePage());
                          }
                        },
                        child: Text("Send"))
                  ],
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
