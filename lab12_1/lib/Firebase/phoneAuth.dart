import 'package:firebase_auth/firebase_auth.dart';

signInkithPhone({required String phonenumber,required Function(String) idSms}) async {

await FirebaseAuth.instance.verifyPhoneNumber(
  phoneNumber: '+996555155386',
  verificationCompleted: (PhoneAuthCredential credential) {},
  verificationFailed: (FirebaseAuthException e) {},
  codeSent: (String verificationId, int? resendToken) {
    idSms (verificationId);
  },
  codeAutoRetrievalTimeout: (String verificationId) {},
);

}

