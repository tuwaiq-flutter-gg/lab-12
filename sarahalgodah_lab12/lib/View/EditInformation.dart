import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditInformation extends StatelessWidget {
  EditInformation({super.key});

  TextEditingController? controllerName = TextEditingController();
  TextEditingController? controllerAge = TextEditingController();
  TextEditingController? controllerCity = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Your Information",
        ),
        backgroundColor: Colors.blue[900],
      ),
      body: ListView(children: [
        Container(
          padding: EdgeInsets.all(20),
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Please Enter your new Information",
                  style: TextStyle(fontSize: 20)),
              TextField(
                controller: controllerName,
                decoration: InputDecoration(
                  hintText: "Name",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: controllerAge,
                decoration: InputDecoration(
                  hintText: "Age",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: controllerCity,
                decoration: InputDecoration(
                  hintText: "City",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[900]),
                  onPressed: () {
                    try {
                      var fireStore = FirebaseFirestore.instance;
                      fireStore
                          .collection("Usres") 
                          .doc("OkhKEFN9cKxQcfKIaKWo")
                          .update({
                        "name": controllerName!.text,
                        "age": controllerAge!.text,
                        "city": controllerCity!.text
                        
                      });
                     
                    } catch (e) {}
                     Get.toNamed("/HomePage");
                  },
                  child: Text("Send"))
            ],
          ),
        )
      ]),
    );
  }
}
