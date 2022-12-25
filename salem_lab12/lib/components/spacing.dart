import 'package:flutter/material.dart';

class Spacing extends StatelessWidget {
  Spacing({super.key, required this.height});
  double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
