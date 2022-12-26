import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:lab12_1/main.dart';
import 'package:lab12_1/signin.dart';


anonymouslySignin() async {

  try{
    var auth = FirebaseAuth.instance;

    var user = await auth.signInAnonymously();

  } catch(e){

print(e);
  }
}

funcSignout () async {
try {
var auth = FirebaseAuth.instance;
await auth.signOut(); 
await prefs?.clear ();
Get.offAll (() => signinPage ());
print ("Users is Sign Out ");
} catch (e){
  print (e);
};

}
