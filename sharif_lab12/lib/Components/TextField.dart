// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.title,
    required this.controller,
    required this.formKey,
    this.validator,
  });
  final String title;
  final TextEditingController controller;
  final GlobalKey formKey;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Form(
        key: formKey,
        child: TextFormField(
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 30, right: 30),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide: BorderSide.none,
            ),
            filled: true,
            labelText: title,
          ),
        ),
      ),
    );
  }
}
