// ignore_for_file: library_prefixes, file_names, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:sharif_lab12/Firebase/FirebaseAuth.dart';

abstract class FireStore {
  static final instance = FirebaseFirestore.instance;

  static Future<DocumentSnapshot<Map<String, dynamic>>?> getProfileInfo(
      {required String id}) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> doc =
          await instance.collection("Profile").doc(id).get();
      if (doc.exists) {
        return doc;
      }
    } on FirebaseFirestore catch (error) {
      Get.snackbar(
        "Update Profile Error",
        "$error",
        duration: Duration(seconds: 10),
      );
    }
    return null;
  }

  static setProfileInfo({
    required String name,
    required String email,
    required String age,
  }) async {
    try {
      var userId = Auth.getUserId();
      await instance.collection("Profile").doc(userId).set({
        "name": name,
        "email": email,
        "age": age,
      });
      Get.snackbar(
        "Updated",
        "Profile is updated",
        duration: Duration(seconds: 10),
      );
    } on FirebaseFirestore catch (error) {
      Get.snackbar(
        "Update Profile Error",
        "$error",
        duration: Duration(seconds: 10),
      );
    }
  }
}
