import "package:firebase_auth/firebase_auth.dart";
import 'package:get/get.dart';

    var instance =  FirebaseAuth.instance;

createAccount({required String email, required String password}) async{
  
  try {
    var user = await instance.createUserWithEmailAndPassword(email: email, password: password);
print(user.user?.uid);

  }catch(e){
    print(e);
  }
}

signInWithEmail({required String email, required String password}) async{
  
  try {
    var user = await instance.signInWithEmailAndPassword(email: email, password: password);
print(user.user?.uid);
if(user.user?.uid !=null){
  // Get.to(() => homeMenue());

}

  }catch(e){
    print(e);
  }
}

