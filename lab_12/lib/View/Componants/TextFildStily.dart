import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextFildStyle extends StatelessWidget {
  TextFildStyle({super.key , this.lableName, this.controller});

String? lableName;
TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextField( 
      controller: controller ,
            textAlign: TextAlign.left,
            
            decoration: InputDecoration(
              labelText: lableName,
              labelStyle: TextStyle(color: Color.fromARGB(255, 255, 128, 0)),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey)),
            ));
  }
}