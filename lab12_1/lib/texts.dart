import 'package:flutter/material.dart';
import 'package:lab12_1/datatheme.dart';


class textfilds extends StatelessWidget {
   textfilds({super.key,required this.titlee, this.passAsStars, this.controller});
final String titlee  ;final bool? passAsStars;
final controller;



  @override
  Widget build(BuildContext context) {
var medHi =MediaQuery.of(context).size.height;
var medWd =MediaQuery.of(context).size.width;

    return  Padding(
            padding: const EdgeInsets.all(25.0),
            child: TextField(
              obscureText: false,
              keyboardAppearance: ThemeData.estimateBrightnessForColor(Colors.yellow),
              cursorRadius: Radius.circular(22),
              decoration: InputDecoration(
                
                border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                ),
                fillColor: Color.fromARGB(255, 234, 235, 234),
                filled: true,
                
                focusColor: backcolorMain,
                labelText: titlee,
              ),
            )
            

                  );
  }
}

class textTitle extends StatelessWidget {
  const textTitle({super.key, this.texTitle});
final texTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: 
      Text(texTitle, style: TextStyle(color:Colors.black, fontSize: 22,fontWeight: FontWeight.bold,),),
    
    );
  }
}
class textNormal extends StatelessWidget {
  const textNormal({super.key, required this.textnormal});
  final String textnormal ;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(25),
      child: 
      Text(textnormal, style: TextStyle(color:Colors.black, fontSize: 16,fontWeight: FontWeight.bold),),
    
  
    );
  }
}