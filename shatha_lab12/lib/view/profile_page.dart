import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shatha_lab12/Services/FireBase/email_authentication.dart';
import 'package:shatha_lab12/controller/database_controller.dart';
import 'package:shatha_lab12/view/edit.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    DataBaseController dataController = Get.find();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('your profile '),
          centerTitle: true,
        ),
        body: GetBuilder<DataBaseController>(
          builder: (_) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Center(
                  child: Text('your name : ${dataController.name}'),
                ),

                const SizedBox(height: 10,),

                Center(
                  child: Text('your email : ${dataController.email}'),
                ),

                const SizedBox(height: 10,),
                
                Center(
                  child: Text('your age : ${dataController.age}'),
                ),

                const SizedBox(height: 10,),
                
                Center(
                  child: ElevatedButton(onPressed: () {
                    Get.to(() => const EditInfo());
                  }, child: const Text(' edit info ')),
                ),

                Center(
                  child: ElevatedButton(onPressed: () {
                    userSignOut();
                  }, child: const Text(' log out ')),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}