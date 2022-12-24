import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  Stream<DocumentSnapshot<Map<String, dynamic>>> userStream = FirebaseFirestore
      .instance
      .collection("Usres")
      .doc("OkhKEFN9cKxQcfKIaKWo")
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.person),
        title: Text("Your Information"),
        backgroundColor: Colors.blue[900],
      ),
      body: ListView(children: [
        Container(
          height: 300,
          width: Get.width,
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StreamBuilder(
                  stream: userStream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator(
                        color: Colors.blue,
                      );
                    } else if (snapshot.hasError) {
                      return Text("Error Found..");
                    } else if (snapshot.hasData) {
                      Map? userData;
                      userData = snapshot.data!.data() as Map;
                      return SizedBox(
                        height: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Your ID: ${userData["id"].toString()}", style: TextStyle(fontSize: 20),),
                            Text("Your Name: ${userData["name"].toString()}", style: TextStyle(fontSize: 20)),
                            Text("Your Age: ${userData["age"].toString()}", style: TextStyle(fontSize: 20)),
                            Text("Your City: ${userData["city"].toString()}",  style: TextStyle(fontSize: 20)),                 
                          ],
                        ),
                      );
                    }
                    return Text("");
                  }),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[900]),
                  onPressed: () {
                    Get.toNamed("/EditInformation");
                  },
                  child: Text("Edit My Information"))
            ],
          ),
        ),
      ]),
    );
  }
}
