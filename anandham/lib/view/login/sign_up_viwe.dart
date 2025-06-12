import 'package:anandham/common_widget/round_button.dart';
import 'package:anandham/common_widget/round_textfield.dart';
import 'package:anandham/view/login/login_view.dart';
import 'package:anandham/view/login/otp_view.dart';
import 'package:flutter/material.dart';
import 'package:anandham/common/color_extension.dart';

class SignUpViwe extends StatefulWidget {
  const SignUpViwe({super.key});

  @override
  State<SignUpViwe> createState() => _SignUpViweState();
}

class _SignUpViweState extends State<SignUpViwe> {
  final TextEditingController txtName = TextEditingController();
  final TextEditingController txtEmail = TextEditingController();
  final TextEditingController txtMobile = TextEditingController();
  final TextEditingController txtAddress = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();
  final TextEditingController txtConfirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: media.height * 0.05,
            ),
            // Sign up text
            Align(
              alignment: const AlignmentDirectional(0.0, -1.0),
              child: Text(
                "Sign Up",
                style: TextStyle(
                    color: TColor.primary,
                    fontWeight: FontWeight.w800,
                    fontSize: 40),
              ),
            ),
            // detail text
            Text(
              "Add your details to sign up",
              style: TextStyle(
                  color: TColor.secondarytext,
                  fontWeight: FontWeight.w400,
                  fontSize: 15),
            ),
            SizedBox(
              height: media.height * 0.05,
            ),
            // Name input field
            RoundTextfield(
              hintText: "Name",
              controller: txtName,
            ),
            SizedBox(
              height: media.height * 0.03,
            ),
            // Email input field
            RoundTextfield(
              hintText: "Your Email",
              controller: txtEmail,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: media.height * 0.03,
            ),
            // Phone number input field
            RoundTextfield(
              hintText: "Mobile No",
              controller: txtMobile,
              keyboardType: TextInputType.phone,
            ),
            SizedBox(
              height: media.height * 0.03,
            ),
            // Address input field
            RoundTextfield(
              hintText: "Address",
              controller: txtAddress,
              keyboardType: TextInputType.streetAddress,
            ),
            SizedBox(
              height: media.height * 0.03,
            ),
            // Password input field
            RoundTextfield(
              hintText: "Password",
              controller: txtPassword,
              obscureText: true,
            ),
            SizedBox(
              height: media.height * 0.03,
            ),
            // confirm input field
            RoundTextfield(
              hintText: "Comfirm Password",
              controller: txtConfirmPassword,
              obscureText: true,
            ),
            SizedBox(
              height: media.height * 0.03,
            ),
            // sign up button
            RoundButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const OtpView()));
                },
                title: "Sign Up"),
            SizedBox(
              height: media.height * 0.08,
            ),
            // Text for login
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginView()));
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Already have an Account? ",
                    style: TextStyle(
                        color: TColor.primarytext,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  Text(
                    "Login",
                    style: TextStyle(
                        color: TColor.primary,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
