import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:lab_12/View/profilePage.dart';

// first init FirebasaAuth

var instance = FirebaseAuth.instance;

SingInWithEmail({required String email, required String password}) async {
  try {
    var user = await instance.signInWithEmailAndPassword(
        email: email, password: password);

    print("Step 1");

    if (user.user?.uid != null) {
      Get.to(() => ProfilePage());
    }
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

printEmail() {
  // print email
  return instance.currentUser?.email;
}

updateEmail({required UEmail}) {
  var user = instance.currentUser!.updateEmail(UEmail);
}

LogOut() async {
  try {
    var auth = FirebaseAuth.instance;
    print("Sepe 1 true");

    await auth.signOut();
    //  await prefs?.clear();
    Get.offAll(() => LogOut());
    print("Sepe 2 true");
  } catch (e) {
    print(e);
  }
}
