import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDataController extends GetxController {
  TextAlign arTxt = TextAlign.left;
  AlignmentGeometry arAlignment = Alignment.topRight;
  TextEditingController emailtxt = TextEditingController();
  TextEditingController passtxt = TextEditingController();
  TextEditingController newEmail = TextEditingController();
  TextEditingController agetxt = TextEditingController();
  TextEditingController nametxt = TextEditingController();


  updateCon() {
    arTxt == TextAlign.left ? TextAlign.right : TextAlign.left;
    if (arTxt == TextAlign.left) {
      arTxt = TextAlign.right;
    } else {
      arTxt = TextAlign.left;
    }

    if (arAlignment == Alignment.topRight) {
      arAlignment = Alignment.topLeft;
    } else {
      arAlignment = Alignment.topRight;
    }

    update();
  }


}
