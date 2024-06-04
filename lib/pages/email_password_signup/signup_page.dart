import 'package:firebase_login/pages/email_password_signup/signup_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class TSignUpPage extends StatefulWidget {
  @override
  _TSignUpPageState createState() => _TSignUpPageState();
}

class _TSignUpPageState extends State<TSignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final SignupPageController _signupPageController = Get.put(SignupPageController());

  bool _validateEmail(String value) {
    // Regular expression pattern for email validation
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(value);
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _signupPageController.signup();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign up with email and password',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Enter your email and password properly',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Column(
                    children: [
                      TextFormField(
                        controller: _signupPageController.emailController,
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
                          if (!_validateEmail(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      Obx(() {
                        return TextFormField(
                        controller: _signupPageController.passwordController,
                        obscureText: _signupPageController.isPasswordHidden.value,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _signupPageController.isPasswordHidden.value ? Icons.visibility : Icons.visibility_off,
                            ),
                            onPressed: () {
                             _signupPageController.togglePasswordVisibility();
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                      );
                      },),
                      
                      SizedBox(height: 16.0),
                      Obx(() {
                        return TextFormField(
                        controller: _signupPageController.confirmPasswordController,
                        obscureText: _signupPageController.isPasswordHidden.value,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          prefixIcon: Icon(Icons.lock),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != _signupPageController.passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ); 
                      },),
                      
                      SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: _submitForm,
                        child: Text('Sign Up'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                children: [
                  Text("you have been an Account ?"),
                  TextButton(onPressed: () {
                    Get.toNamed("/loginPage");
                  }, child: Text("login"))
                ],
              )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}