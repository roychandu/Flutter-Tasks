import 'dart:convert';

import 'package:calley_task/Models/registerdata_model.dart';
import 'package:calley_task/Services/api_url.dart';
import 'package:calley_task/common_widgets/CustomElevated_button.dart';
import 'package:calley_task/common_widgets/Custom_textfield.dart';
import 'package:calley_task/screens/login%20and%20register%20screens/login_screen.dart';
import 'package:calley_task/screens/login%20and%20register%20screens/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _LoginScreenState();
}

Future<void> registeruser(
  BuildContext context,
  String username,
  String email,
  String password,
  String whatsapp,
  String phone,
) async {
  RegisterDataModel request = RegisterDataModel(
    username: username,
    email: email,
    password: password,
    whatsapp: whatsapp,
    phone: phone,
  );
  try {
    final response = await http.post(
      Uri.parse(ApiUrl.Register),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "username": request.username,
        "email": request.email,
        "password": request.password,
        "Whatsapp": request.whatsapp,
        "phone": request.phone,
      }),
    );
    if (response.statusCode == 201) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('userName', username);
      await prefs.setString('email', email);
      await prefs.setString('whatsapp', whatsapp);
      await prefs.setString('phone', phone);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '${username} successfully registered!',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color(0xff2563EB),
        ),
      );
      final response1 = await http.post(
        Uri.parse(ApiUrl.Otp),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": request.email}),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OtpScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'User with this email already exists',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color(0xff2563EB),
        ),
      );
    }
  } catch (e) {
    print(e);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error ${e.toString()}'),
        backgroundColor: Color(0xff2563EB),
      ),
    );
  }
}

class _LoginScreenState extends State<RegisterScreen> {
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController moblieNumber = TextEditingController();
  TextEditingController whatsappNumber = TextEditingController();
  bool _isChecked = false;
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
                      top: 40,
                      bottom: 20,
                    ),
                    child: Column(
                      spacing: 20,
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
                        CustomInputTextWithVisiable(
                          hint: 'Name',
                          controller: userName,
                          icon: Icon(Icons.person_3_outlined),
                        ),
                        CustomInputTextWithVisiable(
                          hint: 'Email address',
                          controller: email,
                          icon: Icon(Icons.email_outlined),
                        ),
                        CustomInputTextWithVisiable(
                          hint: 'Password',
                          controller: password,
                          icon: Icon(Icons.lock_outline_rounded),
                        ),
                        TextField(
                          controller: whatsappNumber,
                          style: TextStyle(
                            color: Colors.black,
                          ), // Text is black here
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                mainAxisSize: MainAxisSize
                                    .min, // Important: limits Row to needed space
                                children: [
                                  Image.asset(
                                    'assets/image 52.png',
                                    width: 24,
                                    height: 24,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    '+91',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            prefixIconConstraints: BoxConstraints(
                              minWidth: 0,
                              minHeight: 0,
                            ),
                            suffixIcon: Icon(FontAwesomeIcons.whatsapp),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            labelText: "WhatsApp Number",
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                          ),
                        ),

                        CustomInputTextWithVisiable(
                          hint: 'Mobile number',
                          controller: moblieNumber,
                          icon: Icon(Icons.lock_outline_rounded),
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: _isChecked,
                              onChanged: (value) {
                                setState(() {
                                  _isChecked = value!;
                                });
                              },
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'I agree to the ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Terms of Conditions',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child: RichText(
                            text: TextSpan(
                              text: 'Already have an account? ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Sign In',
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
                            text: 'Sign Up',
                            onPressed: () {
                              registeruser(
                                context,
                                userName.text,
                                email.text,
                                password.text,
                                whatsappNumber.text,
                                moblieNumber.text,
                              );
                            },
                          ),
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
