//import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab12_1/buttons.dart';
import 'package:lab12_1/signin.dart';
import 'package:lab12_1/texts.dart';


class signUpPage extends StatelessWidget {
   signUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      toolbarHeight: 22,
    ),
     body: 
ListView(
  children: [
    const SizedBox(height: 22,),
    Container(
      padding:const EdgeInsets.all(11) ,
     height: Get.mediaQuery.size.height/6,
    width:  Get.mediaQuery.size.width,
    decoration: BoxDecoration(borderRadius:BorderRadius.circular(33)),
child: Image.asset("images/apple-hero-757.png",fit: BoxFit.cover,),
    ),
    const SizedBox(height: 0,),
      const textTitle(texTitle: "Sign Up"),
      textfilds( titlee: "Username" ),
      textfilds(titlee: "Password",passAsStars: true,),
       textfilds(titlee: "REPassword",passAsStars: true,),
    const buttons(buttonCaption: "sign Up"),
       
      
         Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
           children: [ 
            
            //  Padding(
            //    padding: const EdgeInsets.only(left: 150),
            //    child: InkWell(child: const textNormal(textnormal: "Forgot Password?",),
               
            //    onTap: () =>Get.off(()=> homeMenue()) ,),
            //  ),
             Padding(
               padding: const EdgeInsets.only(left: 170),
               child: InkWell(child: const textNormal(textnormal: "Sign in ?",),
               
               onTap: () =>Get.off(()=>  signinPage()) ,),
             ),
           ],
         ),
     

       

                     
        //          onTap: () {  Get.off(()=> homeMenue()); )
      //buttons(buttonCaption: buttonCaption)


  ],
),
     


    
    );
  }
}