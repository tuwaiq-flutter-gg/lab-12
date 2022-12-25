import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hadeel_lab12/components/ProfileCards.dart';
import 'package:hadeel_lab12/constants/style.dart';
import 'package:hadeel_lab12/controllers/userController.dart';
import 'package:hadeel_lab12/views/editProfile.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    final db = FirebaseFirestore.instance;
    String? userUID = FirebaseAuth.instance.currentUser?.uid;

    Future<DocumentSnapshot<Map<String, dynamic?>?>?>? doc =
        FirebaseFirestore.instance.collection("Users").doc(userUID).get();
    //  .then((value) => userData = value.data() as Map);
    Stream<DocumentSnapshot<Map<String, dynamic>>> stream =
        FirebaseFirestore.instance.collection("Users").doc(userUID).snapshots();
    var streamTest = FirebaseFirestore.instance
        .collection("Users")
        .where("UID", isEqualTo: userUID)
        .snapshots();
    userController controller = Get.find();

    // getData() async {
    //   var userInfo = await FirebaseFirestore.instance
    //       .collection('Users')
    //       .doc(userUID)
    //       .get();

    //   print('**********************');
    //   print(userInfo.exists);
    // }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Profile",
          style: GoogleFonts.openSans(
            fontSize: 24,
            color: colors.Text,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => editProfile());
            },
            icon: Icon(CupertinoIcons.pen),
            color: colors.Text,
          )
        ],
      ),
      body: ListView(
        children: [
          // StreamBuilder(
          //     stream: stream,
          //     builder: (context, snapshot) {
          //       Map userData;
          //       DocumentSnapshot doc;
          //       if (snapshot.connectionState == ConnectionState.waiting)
          //         return Text("Loading");

          //       if (snapshot.hasData) {
          //         //  userData = snapshot.data!.data() as Map;
          //         // doc = snapshot.data!.docs[];
          //         Map<String, dynamic> data =
          //             snapshot.data!.data() as Map<String, dynamic>;
          //         // Map<String, dynamic> data =
          //         //     snapshot.data!.docs as Map<String, dynamic>;
          //         return Text(
          //           //getData(userUID),
          //           // snapshot.data!["Name"].toString(),
          //           // "Full Name: ${data['Age']} ",
          //           style: TextStyle(color: Color(0xff000000)),
          //         );
          //       }
          //       return Text("data");
          //     }),
          //Text(userData.toString()),
          SizedBox(
            height: Get.height * 0.05,
          ),
          // Container(
          //   width: Get.width * 0.1,
          //   height: Get.height * 0.15,
          //   child: CircleAvatar(
          //     maxRadius: 50,
          //     child: ClipRRect(
          //         borderRadius: BorderRadius.circular(100),
          //         child: Image.asset(
          //           "images/pic5.jpeg",
          //           fit: BoxFit.fitWidth,
          //         )),
          //   ),
          // ),
          SizedBox(
            height: Get.height * 0.05,
          ),
          profileCard(
            title: "Name",
            //alue: userData?["Name"],
            icon: CupertinoIcons.person_fill,
          ),
          SizedBox(
            height: Get.height * 0.04,
          ),
          profileCard(
            title: "Age",
            // value: userData?["Age"],
            icon: IconData(0xe120, fontFamily: 'MaterialIcons'),
          ),
          SizedBox(
            height: Get.height * 0.04,
          ),
          profileCard(
            title: "Email",
            // value: userData?["Email"],
            icon: Icons.alternate_email_rounded,
          ),
        ],
      ),
    );
  }
}

getData(String? userUID) {
  FirebaseFirestore.instance.collection("Users").doc(userUID).get().toString();
}
