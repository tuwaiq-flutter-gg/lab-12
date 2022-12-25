import 'package:get/get.dart';


import 'package:hadeel_lab12/views/Profile.dart';
import 'package:hadeel_lab12/views/SignIn.dart';
import 'package:hadeel_lab12/views/editProfile.dart';

List<GetPage<dynamic>>? routerApp = [
  GetPage(
    name: NameRoute.SignIn,
    page: () => SignIn(),
  ),
  GetPage(
    name: NameRoute.Profie,
    page: () => Profile(),
  ),
  GetPage(
    name: NameRoute.EditProfile,
    page: () => editProfile(),
  )
];

abstract class NameRoute {
  static String SignIn = "/SignIn";
  static String Profie = "/profile";
    static String EditProfile = "/editProfile";
}
