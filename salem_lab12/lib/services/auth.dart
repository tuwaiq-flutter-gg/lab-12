import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salem_lab12/controller/mycontroller.dart';
import 'package:salem_lab12/screens/home.dart';

final auth = FirebaseAuth.instance;
MyDataController dataController = Get.put(MyDataController());

late String name = "Name";
late String age = "Age";

signOut() async {
  try {
    final users = await auth.signOut();
    print("Signed out");
  } catch (error) {
    print("");
  } catch (error) {
    print("error");
  }
}

String? usrID = auth.currentUser?.uid;
Future signinEmail(String email, String password) async {
  await FirebaseAuth.instance.fetchSignInMethodsForEmail(email).then(((value) {
    if (value.isEmpty) {
      createUserAccount(
          email: dataController.emailtxt.text,
          password: dataController.passtxt.text);
    } else {
      signInWithEmail(
          email: dataController.emailtxt.text,
          password: dataController.passtxt.text);
    }
    if (usrID != null) {
      Get.to(() => HomePage());
    }
  }));
}

Future resetEmail() async {
  try {
    await auth.currentUser!.updateEmail(dataController.newEmail.text);
  } catch (error) {
    print("object");
  }
}

createUserAccount({required String email, required String password}) async {
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    FirebaseFirestore.instance.collection("profile").doc(usrID.toString()).set({
      "Name": name,
      "Age": age,
      "Email": "${FirebaseAuth.instance.currentUser?.email}"
    });
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}

signInWithEmail({required String email, required String password}) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}

updateName() {
  try {
    if (name != null) {
      name = dataController.nametxt.text;
      FirebaseFirestore.instance
          .collection("profile")
          .doc(usrID)
          .update({"Name": name});
    }
  } catch (e) {
    print(e);
  }
}

updateAge() {
  try {
    if (age != null) {
      age = dataController.agetxt.text;
      FirebaseFirestore.instance
          .collection("profile")
          .doc(usrID)
          .update({"Age": age});
    }
  } catch (e) {
    print(e);
  }
}




