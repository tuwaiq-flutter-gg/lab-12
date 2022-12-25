import 'package:get/get.dart';

class Languages extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "en_US": {
          "Sign in": "Sign in",
          "Username": "Username",
          "Password": "Password",
          "t&c": "I agree to the Terms & Conditions",
          "Fpwd": "Forgot Password?",
          "Osignup": "Or Sign up"
        },
        "ar_SA": {
          "Sign in": "تسجيل الدخول",
          "Username": "اسم المستخدم",
          "Password": "كلمة المرور",
          "t&c": "أوافق على الشروط والأحكام",
          "Fpwd": "نسيت كلمة المرور؟",
          "Osignup": "او تسجيل جديد"
        },
      };
}