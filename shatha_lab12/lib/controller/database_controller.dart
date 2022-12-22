import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shatha_lab12/Services/FireBase/email_authentication.dart';
import 'package:shatha_lab12/controller/textfield_controller.dart';


class DataBaseController extends GetxController {
  
  late String name = '';
  late String email = getUserEmail();
  late String age = '';
  var firestore = FirebaseFirestore.instance;

  TextFieldController textController = Get.find();

  getData() async {
    

    var userInfo = await firestore.collection('personalInfo').doc(getUserID()).get();

    print('-------------------------------------------------------------------------------');
    print(userInfo.exists);

    // var data = .get();

    // if (data.exists) {
    //   name = data.data()!['name'];
    //   age = data.data()!['age'];
    //   update();
    // }

  }

  setNewData(){
    firestore.collection('personalInfo').doc(getUserID()).set({'name':name , 'age':age});
  }

  updateName(){
    
    name = textController.name.text;
    firestore.collection('personalInfo').doc(getUserID()).update({'name':name});

    update();

  }

  updateEmail(){
    try {

      email = textController.email.text;

      instance.currentUser?.updateEmail(textController.email.text);

      update();

      Get.snackbar('Email updated successfully', '');

      

    } catch (error) {
      print(error);
    }
    update();
  }

  updateAge(){
    age = textController.age.text;
    firestore.collection('personalInfo').doc(getUserID()).update({'age':age});

    update();

  }
  

  @override
  void onReady() {
    super.onReady();
    getData();
  }

}
