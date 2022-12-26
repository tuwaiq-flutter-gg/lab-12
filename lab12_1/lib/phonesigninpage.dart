import 'package:flutter/material.dart';
import 'package:lab12_1/Firebase/phoneAuth.dart';


class phonesignin extends StatelessWidget {
   phonesignin({super.key});
  String? idsmss ;

  @override
  Widget build(BuildContext context) {
    return Scaffold
    
    (

      body: ListView(
        children: [

          ElevatedButton(onPressed:() {
            signInkithPhone(phonenumber: "phonenumber", idSms:(Value){
              idsmss = Value;
            } );
          } , child: Text("send sms"))
        ],
      )
    );
  }
}