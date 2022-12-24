

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:ruba_lab11/Control/Control.dart';
import 'package:ruba_lab11/Screen/Home.dart';

Control Controller = Get.put(Control());
var instance = FirebaseAuth.instance;
final info= FirebaseFirestore.instance;


 signInWithEmail({required String email, required String password}) async {
  try {
    var user = await instance.signInWithEmailAndPassword(
        email: email, password: password);

    if (user.user?.uid != null) {
      Get.to(() => Home());
    }
  } on FirebaseAuthException catch (error) {
    print(error.code);
    if (error.code == "wrong-password") {
      Get.snackbar("wrong", "Email or password is wrong");
    } else if (error.code == "network-request-failed") {
      Get.snackbar("wrong", "check your connections");
    }else if(error.code == "invalid-email"){
      Get.snackbar("wrong", "check your Email");
    }else if(error.code=="user-not-found"){
       Get.snackbar("wrong", "You do not have an account");
    }
  }
}

UpdateEmail() async {
  try {
    await instance.currentUser!.updateEmail(Controller.updateEmailController.text);
  } catch (error) {
    print(error);
  }
}

updatingProfile(
    { String? name,  String? lastName,  String? University}) {
  info.collection("information").doc("sJLWHvJ1lwbdMglFSbMI").update({
                "name":name, 
                "lastName":lastName,
                "University":University}).whenComplete(() {
                  Get.to(Home());
                });                
}