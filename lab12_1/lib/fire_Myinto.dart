import 'package:flutter/material.dart';
// Import the firebase_core and cloud_firestore plugin
import 'package:cloud_firestore/cloud_firestore.dart';

class AddUser extends StatefulWidget {
  final String? fullName;
  final String? company;
  final int? age;
  AddUser({super.key, this.fullName, this.company, this.age});

  @override
  State<AddUser> createState() => _AddUserState();
}
class _AddUserState extends State<AddUser> {
  // final firestore Firebasestore.ins
  Stream<QuerySnapshot> userStream = FirebaseFirestore.instance.collection("222").snapshots();

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    return
    Scaffold(body: 

    // Create a CollectionReference called users that references the firestore collection
    ListView(
      children: [
        Text("datafdasdfaa"),
        StreamBuilder<QuerySnapshot>(
      stream: userStream,
      builder:(context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting){
          return Text("Loeading.....");
        }
        if (snapshot.hasError){
          return Text("Error.....");
        }
        if (snapshot.hasData){
          return Column(
            children: snapshot.data!.docs
            .map((e) => Text(e.data().toString())).toList(),
          );
        }
        return Text("nothing");
      
    }),
      ],
    )

    // Future<void> addUser() {
    //   // Call the user's CollectionReference to add a new user
    //   return users
    //       .add({
    //         'full_name': widget.fullName, // John Doe
    //         'company': widget.company, // Stokes and Sons
    //         'age': widget.age // 42
    //       })
    //       .then((value) => print("User Added"))
    //       .catchError((error) => print("Failed to add user: $error"));
    // }

    // return TextButton(
    //   onPressed: addUser,
    //   child: Text(
    //     "Add User",
    //   ),
    // ),
    );
  }
}