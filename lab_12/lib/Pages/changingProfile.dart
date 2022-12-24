import 'package:flutter/material.dart';
import 'package:lab_12/Firebase/profile.dart';

class ChangingProfile extends StatelessWidget {
  ChangingProfile({super.key});
  TextEditingController newName = TextEditingController();
  TextEditingController newEmail = TextEditingController();
  TextEditingController newAge = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        child: ListView(children: [
          SizedBox(
            height: 50,
          ),
          TextField(
            controller: newName,
            decoration: InputDecoration(label: Text("New Name")),
          ),
          TextField(
            controller: newEmail,
            decoration: InputDecoration(label: Text("New Email")),
          ),
          TextField(
            controller: newAge,
            decoration: InputDecoration(label: Text("New Age")),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                // UpdateingEmail(newEmail: newEmailController.text);
                updatingProfile(
                    name: newName.text, email: newEmail.text, age: newAge.text);
              },
              child: Text("chenging Profile"))
        ]),
      ),
    );
  }
}
