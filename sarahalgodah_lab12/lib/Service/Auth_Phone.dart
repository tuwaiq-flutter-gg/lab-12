
import 'package:firebase_auth/firebase_auth.dart';

var instance =  FirebaseAuth.instance;

sginInWithPhoneNumber({required String phone , Function(String)? db}) async{

  try {
    await instance.verifyPhoneNumber(
  phoneNumber: phone,
  
  verificationCompleted: (PhoneAuthCredential credential) {},

  verificationFailed: (FirebaseAuthException e) {
    print(e);
  },
  codeSent: (String verificationId, int? resendToken) {
    db!(verificationId);
  },
  codeAutoRetrievalTimeout: (String verificationId, ) {

  },
);
  } catch (e) {
    print(e);
  }

}
