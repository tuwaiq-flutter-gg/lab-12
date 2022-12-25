import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

updateProfile({String? name, String? age, String? email, String? UID}) async {
  if (name != null)
    FirebaseFirestore.instance
        .collection("Users")
        .doc(UID)
        .update({"Name": name});
  if (age != null)
    FirebaseFirestore.instance
        .collection("Users")
        .doc(UID)
        .update({"Age": age});
  if (email != null) updateEmail(email: email, UID: UID);
}

updateEmail({String? email, String? UID}) async {
  try {
    await FirebaseAuth.instance.currentUser!.updateEmail(email!);
    FirebaseFirestore.instance
        .collection("Users")
        .doc(UID)
        .update({"Email": "${email}"});
  } catch (error) {
    print("object");
  }
}
