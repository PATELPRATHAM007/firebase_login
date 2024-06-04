import 'package:firebase_login/services/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPageController extends GetxController{

  final FirebaseAuthService _authService = Get.find<FirebaseAuthService>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final isPasswordHidden = false.obs;

   @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  Future<void> signup() async {

    bool success = await _authService.signUp(emailController.text, passwordController.text);

    if (success) {
      Get.snackbar('signup Successful', 'You are logged in');
    } else {
      Get.snackbar('signup Failed', 'Invalid email or password');
    }
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }
}