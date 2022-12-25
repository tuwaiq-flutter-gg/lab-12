import 'package:flutter/material.dart';

class MainTextField extends StatelessWidget {
  const MainTextField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    required this.controller,
  });

  final String hintText;
  final TextEditingController controller;
  final Icon? prefixIcon;
  final Icon? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.5,
            color: Colors.black38,
          ),
        ),
      ),
    );
  }
}
