import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shatha_lab12/Services/FireBase/email_authentication.dart';
import 'package:shatha_lab12/controller/database_controller.dart';
import 'package:shatha_lab12/controller/textfield_controller.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {

    TextFieldController controller = Get.put(TextFieldController());
    DataBaseController datacontroller = Get.put(DataBaseController());

    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
    
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [

                  const SizedBox(height: 10,),

                  const Center(child: Text('email :'),),
                  Center(child: TextField(controller: controller.email,),),

                  const SizedBox(height: 10,),

                  const Center(child: Text('password :'),),
                  Center(child: TextField(controller: controller.password,),),

                  const SizedBox(height: 10,),

                  const Text('hint: remumber your inputs '),

                  const SizedBox(height: 10,),

                  Center(child: ElevatedButton(onPressed: () {
                  createAccount(email: controller.email.text, password: controller.password.text);
                }, child: const Text('Log in')),),


                ],
              ),
            )
    
          ],
        ),
      ),
    );
  }
}