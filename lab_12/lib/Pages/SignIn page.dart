import 'package:flutter/material.dart';
import 'package:lab_12/Firebase/Auth/EmailAndPassword.dart';

class SignInPage extends StatelessWidget {
   SignInPage({super.key});

  
  TextEditingController? EmailController = TextEditingController();
  TextEditingController? PasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
          padding: EdgeInsets.all(50),
          child: ListView(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                width: 100,
                child: TextField(
                  controller: EmailController,
                  decoration: InputDecoration(label: Text("Email")),
                ),
              ),
              Container(
                width: 100,
                child: TextField(
                  controller: PasswordController,
                  decoration: InputDecoration(label: Text("Password")),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  SigninEmailPassword(
                      emailAddress: EmailController!.text,
                      password: PasswordController!.text);
                },
                child: Text("Log in"),
              )
            ],
          )),
    );
  }
  
}