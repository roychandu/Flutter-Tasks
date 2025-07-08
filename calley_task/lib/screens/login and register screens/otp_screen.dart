import 'dart:convert';

import 'package:calley_task/Models/verify_model.dart';
import 'package:calley_task/Services/api_url.dart';
import 'package:calley_task/common_widgets/CustomElevated_button.dart';
import 'package:calley_task/screens/login%20and%20register%20screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _LoginScreenState();
}

Future<void> VerifyCall(BuildContext context, String email, String otp) async {
  VerifyModel request = VerifyModel(email: email, otp: otp);
  print(email);
  try {
    final response = await http.post(
      Uri.parse(ApiUrl.verify),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": request.email, "otp": request.otp}),
    );
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'OTP Verified!',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color(0xff2563EB),
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Invalid OTP',
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

class _LoginScreenState extends State<OtpScreen> {
  String phone = '';
  String email = '';
  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      phone = prefs.getString("phone") ?? "";
      email = prefs.getString("email") ?? "";
    });
  }

  TextEditingController otpText = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Check your email!',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color(0xff2563EB),
        ),
      );
    });
    loadData();
  }

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
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              'Whatsapp OTP Verification',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              textAlign: TextAlign.center,
                              'Please ensure that the email id mentioned is valid as we have sent an OTP to your email.',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 40),
                            PinCodeTextField(
                              controller: otpText,
                              appContext: context,
                              length: 6,
                              onCompleted: (value) {},
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(10),
                                fieldHeight: 50,
                                fieldWidth: 48,
                                inactiveColor: Colors.blueGrey,
                                activeColor: Colors.blueGrey,
                                selectedColor: Colors.blueGrey,
                              ),
                              keyboardType: TextInputType.number,
                            ),
                            Text(
                              '+91 ${phone} ?',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        Column(
                          spacing: 10,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: RichText(
                                text: TextSpan(
                                  text: "Don't receive OTP code? ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Resend OTP',
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
                                text: 'Verify',
                                onPressed: () {
                                  VerifyCall(context, email, otpText.text);
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
