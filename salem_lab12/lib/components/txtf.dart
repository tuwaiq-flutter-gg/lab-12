import 'package:flutter/material.dart';
import 'package:salem_lab12/main.dart';

class Txtf extends StatelessWidget {
  Txtf({super.key, required this.hint, required this.arTxt, required this.contr});
  TextEditingController contr;
  String hint;
  TextAlign arTxt;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: arTxt,
      controller: contr,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(fontSize: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          contentPadding: EdgeInsets.all(16),
          fillColor: lightgrey),
    );
  }
}