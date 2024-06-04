import 'package:firebase_login/services/firebase_auth_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController {
  final FirebaseAuthService _authService = Get.find<FirebaseAuthService>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var isLoading = false.obs;
  final isPasswordHidden = true.obs;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> login() async {
    isLoading.value = true;
    bool success = await _authService.login(emailController.text, passwordController.text);
    isLoading.value = false;

    if (success) {
      Get.snackbar('Login Successful', 'You are logged in');
    } else {
      Get.snackbar('Login Failed', 'Invalid email or password');
    }
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }
}
