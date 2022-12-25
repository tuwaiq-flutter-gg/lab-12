import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

var instance = FirebaseAuth.instance;

signInWithEmail({
  required String email,
  required String password,
}) async {
  try {
    var user = await instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (user.user?.uid != null) {
      return user.user!.uid;
    }
  } on FirebaseAuthException catch (error) {
    print(error.code);
    if (error.code == "wrong-password") {
      print(error);
      Get.snackbar("wrong", "Email or password is not currect");
    }
  }
}
