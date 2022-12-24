import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class textfield extends StatelessWidget {
  const textfield({super.key, required this.co, required this.Title});
  final TextEditingController co;
  final String Title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextField(
        controller: co,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          fillColor: Color.fromARGB(255, 225, 232, 236),
          labelText: Title,
        ),
      ),
    );
  }
}
