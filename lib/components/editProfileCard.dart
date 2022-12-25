import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hadeel_lab12/components/customTextFieldProfile.dart';
import 'package:hadeel_lab12/constants/style.dart';

class editProfileCard extends StatelessWidget {
  editProfileCard(
      {super.key,
      this.title,
      this.value,
      this.icon,
      required this.name,
      required this.enabled,
      this.hint,
      this.controller,
      this.prefixIcon});
  final String? title;
  final String? value;
  final IconData? icon;

  final String name;
  final String? hint;
  final Icon? prefixIcon;
  bool isPass = false;
  bool enabled = true;
  TextInputType? keyboardType = TextInputType.text;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 20,
                color: colors.primary,
              ),
              SizedBox(
                width: Get.width * 0.02,
              ),
              Text(
                title.toString(),
                style: GoogleFonts.openSans(
                  fontSize: 18,
                  color: colors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              customTextFieldProfile(
                enabled: enabled,
                name: name,
                keyboardType: keyboardType,
                hint: hint,
                controller: controller,
              ),
            ],
          )
        ],
      ),
    );
  }
}
