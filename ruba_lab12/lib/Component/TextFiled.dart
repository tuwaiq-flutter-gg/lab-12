import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextFileded extends StatelessWidget {
    TextFileded({super.key, this.title,  this.fromkey,  this.scureText,this.controller1});
final String? title;
 bool? scureText=true;
 TextEditingController? controller1;
 final GlobalKey? fromkey;
  @override
  Widget build(BuildContext context) {
    return 
    Column(
      children: [
         Text(title.toString(),style: TextStyle
         (fontSize: 20,fontWeight: FontWeight.bold),
         ),
            Padding(padding: EdgeInsets.only(left: 25,right: 25),
            child: Column(
              children: [
                SizedBox(height: 40,
                  child: Form(key: fromkey,
                    child: TextFormField(obscureText: scureText!,
                    controller: controller1,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                if(value.length<6){ return "text is empty";}
                                return null;
                               
                              },

                      decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        fillColor: Color.fromARGB(255, 197, 186, 228),
                      ),
                    ),
                  ),
                )
              ],
            ),   
            )
      ],
    );
         
  }
}