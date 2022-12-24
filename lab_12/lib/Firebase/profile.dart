import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:lab_12/Pages/HomePage.dart';

var instance = FirebaseFirestore.instance.collection("My info");
//String Name;

getProfile({required String creantUser}) async {
  List Mydata = [];
  String resl;

  var name = await instance.doc(creantUser).get();
  print(name);
  print(name["data"]);
  print("=================");
  return name;

  //print(userInfo["Name"] + "aaaaa");
}

updatingProfile(
    {required String name, required String email, required String age}) {
  instance
      .doc("1avL6pULC7Ho78668E2B")
      .update({"Name": name, "email": email, "age": age}).whenComplete(() {
    Get.off(HomePage());
    Get.snackbar("Changed", "your profile had been updated");
  });
}


// viewProfile() async {
//   var info = await getProfile(creantUser: "1avL6pULC7Ho78668E2B");
//   //print(info["Name"]);
//   return info["Name"].toString();
// }
