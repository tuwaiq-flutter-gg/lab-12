import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Bbar extends StatelessWidget {
  Bbar(
      {super.key,
      required this.bname,
      required this.textcolor,
      required this.bcolor});
  String bname;
  Color textcolor;
  Color bcolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: Get.width,
      decoration: BoxDecoration(
        color: bcolor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
          child: Text(
        bname,
        style: TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold, color: textcolor),
      )),
    );
  }
}