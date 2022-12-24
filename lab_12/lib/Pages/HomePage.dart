import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_12/Firebase/profile.dart';
import 'package:lab_12/Pages/changingProfile.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController newEmailController = TextEditingController();

  var instance = FirebaseAuth.instance;
  var GetName = "";
  var GetEmail = "";
  var GetAge = "";

  //String Name = viewProfile();

  @override
  void initState() {
    super.initState();
    futchGetProfile();
  }

  futchGetProfile() async {
    var myInfo = await getProfile(creantUser: "1avL6pULC7Ho78668E2B");
    print(myInfo);

    setState(() {
      print(myInfo);
      GetName = myInfo["Name"];
      GetEmail = myInfo["email"];
      GetAge = myInfo["age"];
      print(GetName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(50),
          child: ListView(
            children: [
              SizedBox(
                height: 50,
              ),

              //Text("Name" + GetName.toString()),
              Text("My name: " + GetName.toString()),
              Text("My email: " + GetEmail.toString()),
              Text("My Age: " + GetAge),
             
              ElevatedButton(
                  onPressed: () {
                    // UpdateingEmail(newEmail: newEmailController.text);
                    Get.to(ChangingProfile());
                  },
                  child: Text("chenging Email"))
            ],
          )),
    );
  }
}
