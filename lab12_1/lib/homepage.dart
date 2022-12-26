import 'package:flutter/material.dart';
import 'package:lab12_1/fire_Myinto.dart';
import 'package:lab12_1/texts.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 221, 183),
      appBar: AppBar(),
      body: ListView(
        children: [
          Center(
            child: Container(
              child: Column(
                children: [
                  textTitle(texTitle: "none",)
                  
                ],
              ),
            ),
          )
        ],
      ),




    );
  }
}