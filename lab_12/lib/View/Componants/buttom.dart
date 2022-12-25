import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ButtomStyle extends StatelessWidget {
  ButtomStyle({super.key, required this.text, this.onTap});

  String? text;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 60,
        width: 200,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 128, 0),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Text(
          text!,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    );
  }
}
