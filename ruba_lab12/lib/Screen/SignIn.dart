import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ruba_lab11/Component/TextFiled.dart';
import 'package:ruba_lab11/Component/button.dart';
import 'package:ruba_lab11/Control/Control.dart';
import 'package:ruba_lab11/Control/Control.dart';
import 'package:ruba_lab11/Service/Firebase/Auth.dart';

class SignIn extends StatelessWidget {
   SignIn({super.key});
bool check=false;
Control Controller = Get.put(Control());
final _formKeyEmail= GlobalKey<FormState>();
final _formKeyPassword= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            TextButton(onPressed: (){ 
               Get.locale == Locale("en", "US")?
                Get.updateLocale(Locale("ar", "SA"))
                :Get.updateLocale(Locale("en", "US"));
                }, child: Text("A9".tr,textAlign: TextAlign.center,)),
            SizedBox(height: 20,),
            Text("A1".tr,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),textAlign: TextAlign.center),
            SizedBox(height: 20,),
            TextFileded(title: "A2".tr,fromkey: _formKeyEmail, scureText: false,controller1: Controller.emailController),
            SizedBox(height: 20,),
            TextFileded(title: "A3".tr,fromkey: _formKeyPassword,scureText: true,controller1: Controller.passwordController),
            SizedBox(height: 20,),
            
                    SizedBox(height: 40,),           
                    Center(
                 child:Button(title: "A1".tr,onPressed:(() async{
                  signInWithEmail(email: Controller.emailController.text,password: Controller.passwordController.text);

                 }),)
              ),
              
          ],
        ),
      ),
    
    
    );
  }
}

    