import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

//Sign in method
SignInMethod({required String emailAddress, required String password}) async {
  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailAddress, password: password);
    print(credential.user!.uid);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}

//Sign up method
SignUpMethod({
  required String emailAddress,
  required String password,
  required String age,
  required String city,
  required String name,
}) async {
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
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

//Sign out method
SignOutMethod() async {
  await FirebaseAuth.instance.signOut();
}

SetProfile(
    {required String email,
    required String name,
    required String age,
    required String city}) async {
  String userID = await checkusers();
  print(userID);
  var firestore = FirebaseFirestore.instance;
  await firestore.collection("Users").doc(userID).set({
    "Name": name,
    "Age": age,
    "Email": email,
    "City": city,
  });
}

UpdateProfile(
    {required String email,
    required String name,
    required String age,
    required String city}) async {
  String userID = await checkusers();
  print(userID);
  var firestore = FirebaseFirestore.instance;
  await firestore.collection("Users").doc(userID).update({
    "Name": name,
    "Age": age,
    "Email": email,
    "City": city,
  });
  await ubdatingemail(email: email);
}

checkusers() async {
  try {
    final auth = await FirebaseAuth.instance;
    final users = await auth.currentUser?.uid;
    print(users);
    return users;
  } on FirebaseAuthException catch (e) {
    switch (e.code) {
      case "operation-not-allowed":
        print("Anonymous auth hasn't been enabled for this project.");
        break;
      default:
        print("Unknown error.");
    }
  }
}

getProfile() async {
  String id = await checkusers();
  print(id);
  var firestore = FirebaseFirestore.instance;
  var x = await firestore.collection("Users").doc(id).get();
  return x;
}

Future ubdatingemail({required String email}) async {
  try {
    await FirebaseAuth.instance.currentUser!.updateEmail(email);
  } catch (e) {
    print(e);
  }
}
