import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/state_manager.dart';
import 'package:lab_13/main.dart';

class Start extends GetxService {
  checkUsers() async {
    var inst = FirebaseAuth.instance;

    var userID = inst.currentUser?.uid;
    print(userID);
    if (userID?.isEmpty == false) {
      prefs?.setString("id", userID!);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkUsers();
  }
}

