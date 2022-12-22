import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shatha_lab12/controller/database_controller.dart';
import 'package:shatha_lab12/view/login.dart';
import 'package:shatha_lab12/view/profile_page.dart';

final instance  = FirebaseAuth.instance;

createAccount({required String email , required String password}) async {
  try {
    
    final user = await instance.createUserWithEmailAndPassword(email: email, password: password) ;

    DataBaseController dataController = Get.find();

    dataController.setNewData();

    loginWithEmail(email: email, password: password);

    print(user.user!.uid);

  } on FirebaseAuthException catch (error) {
    if (error.code == 'email-already-in-use' ) {
      loginWithEmail(email: email, password: password);
    }
    print(error);
  } catch(e) {
    print(e);
  }
}

loginWithEmail({required String email , required String password}) async {
  try {

    final user = await instance.signInWithEmailAndPassword(email: email, password: password);

    if (user.user?.uid != null) {
      Get.offAll( () => const ProfilePage() );
    }

  } on FirebaseAuthException catch (error) {
    Get.snackbar(error.code , error.code );
    print('wrong $error');
  }
}

userSignOut() async {
  try {

    await  FirebaseAuth.instance.signOut();
    print('signed out');

    Get.offAll(const Login());

  } catch (e) {
    print(e);
  }
}

getUserEmail(){
  return instance.currentUser?.email;
}

getUserID(){
  return instance.currentUser?.uid;
}
