import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/route_manager.dart';
import 'package:lab_12/View/Componants/TextFildStily.dart';
import 'package:lab_12/sivers/firebase/EmailPassword.dart';

class Login extends StatelessWidget {
  Login({super.key});

  TextEditingController? controllerEmail = TextEditingController();
  TextEditingController? controllerPassWord = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 210, 205, 205),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 200),
              Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    image: new DecorationImage(
                      image: new AssetImage("images/orange.png"),
                      fit: BoxFit.fill,
                    ),
                  )),
              SizedBox(height: 50),
              Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextFildStyle(
                    controller: controllerEmail,
                    lableName: "Email",
                  )),
              Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextFildStyle(
                    controller: controllerPassWord,
                    lableName: "Password",
                  )),
              InkWell(
                onTap: () {
                  SingInWithEmail(
                      email: controllerEmail!.text,
                      password: controllerPassWord!.text);
                  //10203040
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 128, 0),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
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
                    "Log in",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
