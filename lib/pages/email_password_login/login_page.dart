import 'package:firebase_login/pages/email_password_login/login_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TLoginPage extends StatefulWidget {
  const TLoginPage({super.key});

  @override
  State<TLoginPage> createState() => _TLoginPageState();
}

class _TLoginPageState extends State<TLoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final LoginPageController _loginController = Get.put(LoginPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Login Page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login with email and password',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _loginController.emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!value.contains('@') || !value.contains('.')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Obx(() {
                    return TextFormField(
                      controller: _loginController.passwordController,
                      obscureText: _loginController.isPasswordHidden.value,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: "",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _loginController.isPasswordHidden.value ? Icons.visibility_off : Icons.visibility,
                          ),
                          onPressed: _loginController.togglePasswordVisibility,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    );
                  }),
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: () {
                      Get.toNamed("/forgotPassword");
                    },
                    child: Text("forgot password",textAlign: TextAlign.
                    left,),
                  ),
                  SizedBox(height: 20),
                  Obx(() => ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _loginController.login();
                      }
                    },
                    child: _loginController.isLoading.value
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text('Login'),
                  )),
                ],
              ),
              Row(
                children: [
                  Text("you don't have been an Account ?"),
                  TextButton(onPressed: () {
                    Get.toNamed("/signupPage");
                  }, child: Text("Sign up"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
