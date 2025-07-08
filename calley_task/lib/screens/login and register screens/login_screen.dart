import 'dart:convert';

import 'package:calley_task/Models/login_model.dart';
import 'package:calley_task/Services/api_url.dart';
import 'package:calley_task/common_widgets/CustomElevated_button.dart';
import 'package:calley_task/common_widgets/Custom_textfield.dart';
import 'package:calley_task/screens/login%20and%20register%20screens/register_screen.dart';
import 'package:calley_task/screens/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

Future<void> LoginApi(
  BuildContext context,
  String email,
  String password,
) async {
  LoginModel request = LoginModel(email: email, password: password);
  try {
    final response = await http.post(
      Uri.parse(ApiUrl.login),
      headers: {"Content-Type": "application/json"},

      body: jsonEncode({"email": request.email, "password": request.password}),
    );
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Login Successful!',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color(0xff2563EB),
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StartScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Login failed!',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color(0xff2563EB),
        ),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error ${e.toString()}'),
        backgroundColor: Color(0xff2563EB),
      ),
    );
  }
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            spacing: 50,
            children: [
              Image.asset('assets/Logo.png'),
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffCBD5E1), width: 2),
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 100,
                      bottom: 20,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          spacing: 30,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Welcome!',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  'Please register to continue',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              spacing: 20,
                              children: [
                                CustomInputTextWithVisiable(
                                  hint: 'Email address',
                                  controller: email,
                                  icon: Icon(Icons.email_outlined),
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      CustomInputTextWithVisiable(
                                        hint: 'Password',
                                        controller: password,
                                        icon: Icon(Icons.lock_outline_rounded),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Forgot Password?',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterScreen(),
                                  ),
                                );
                              },
                              child: RichText(
                                text: TextSpan(
                                  text: "Don't have an account? ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Sign Up',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: CustomElevatedButton(
                                text: 'Sign In',
                                onPressed: () {
                                  LoginApi(context, email.text, password.text);
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
