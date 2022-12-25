import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salem_lab12/components/bbar.dart';
import 'package:salem_lab12/components/spacing.dart';
import 'package:salem_lab12/components/txtf.dart';
import 'package:salem_lab12/controller/mycontroller.dart';
import 'package:salem_lab12/main.dart';
import 'package:salem_lab12/services/auth.dart';

class Signin extends StatelessWidget {
  Signin({super.key});
  MyDataController dataController = Get.put(MyDataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          TextButton(
            child: Text(
              "English/العربية",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20, color: myorange),
            ),
            onPressed: () {
              dataController.updateCon();
              Get.locale == Locale("en", "US")
                  ? Get.updateLocale(Locale("ar", "SA"))
                  : Get.updateLocale(Locale("en", "US"));
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacing(height: Get.height / 6),
                Text(
                  "Sign in".tr,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                Spacing(height: 20),
                Txtf(
                  contr: dataController.emailtxt,
                  arTxt: dataController.arTxt,
                  hint: "Username".tr,
                ),
                Spacing(height: 10),
                Txtf(
                  contr: dataController.passtxt,
                  arTxt: dataController.arTxt,
                  hint: "Password".tr,
                ),
                Spacing(height: 40),
                InkWell(
                  onTap: () {
                    signinEmail(dataController.emailtxt.text,
                        dataController.passtxt.text);
                    dataController.update();
                    //dataController.passtxt.clear();
                  },
                  child: Bbar(
                    bcolor: myorange,
                    bname: "Sign in".tr,
                    textcolor: Colors.white,
                  ),
                ),
                Spacing(height: 40),
                Align(
                  alignment: dataController.arAlignment,
                  child: InkWell(
                      child: Text(
                    "Fpwd".tr,
                  )),
                ),
                Align(
                  alignment: dataController.arAlignment,
                  child: InkWell(
                      onTap: () {},
                      child: Text(
                        "Osignup".tr,
                        style: TextStyle(color: myorange),
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
