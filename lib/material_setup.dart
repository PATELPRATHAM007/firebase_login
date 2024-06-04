import 'package:firebase_login/pages/email_password_signup/signup_page.dart';
import 'package:firebase_login/pages/forgotpassword/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_login/pages/email_password_login/login_page.dart';


class TMaterialAppSetUp extends StatelessWidget {
  const TMaterialAppSetUp({super.key});

  @override
  Widget build(BuildContext context) {
    return  
      GetMaterialApp(
        getPages: [
          GetPage(
            name: "/loginPage",
            page: () => const TLoginPage(),
            transitionDuration: Duration(milliseconds: 500),
            transition: Transition.rightToLeft,
            curve: Curves.easeIn,
          ),
          GetPage(
            name: "/homepage",
            page: () => const TLoginPage(),
            transitionDuration: Duration(milliseconds: 500),
            transition: Transition.rightToLeft,
            curve: Curves.easeIn,
          ),
          
          GetPage(
            name: "/signupPage",
            page: () => TSignUpPage(),
            transitionDuration: Duration(milliseconds: 500),
            transition: Transition.rightToLeft,
            curve: Curves.easeIn,
          ),
          GetPage(
            name: "/forgotPassword",
            page: () => ForgotPasswordPage(),
            transitionDuration: Duration(milliseconds: 500),
            transition: Transition.rightToLeft,
            curve: Curves.easeIn,
          ),
        ],
        initialRoute: "/loginPage",
      );
  }
}
