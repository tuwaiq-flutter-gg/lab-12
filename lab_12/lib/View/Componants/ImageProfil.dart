import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("images/unnamed.png"),
                fit: BoxFit.fill,
              ),
//color: Color.fromARGB(255, 255, 128, 0),
              borderRadius: BorderRadius.circular(50),
              border:
                  Border.all(color: Color.fromARGB(255, 255, 128, 0), width: 3),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 3),
                ),
              ],
            ),
          );
  }
}