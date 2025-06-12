import 'package:anandham/common_widget/round_button.dart';
import 'package:anandham/common_widget/round_icon_button.dart';
import 'package:anandham/view/login/forgot_password_view.dart';
import 'package:anandham/view/login/sign_up_viwe.dart';
import 'package:flutter/material.dart';
import 'package:anandham/common/color_extension.dart';
import 'package:anandham/common_widget/round_textfield.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController txtEmail = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();

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
            // Login text
            Align(
              alignment: const AlignmentDirectional(0.0, -1.0),
              child: Text(
                "Login",
                style: TextStyle(
                    color: TColor.primary,
                    fontWeight: FontWeight.w800,
                    fontSize: 40),
              ),
            ),
            // Login Detail Text
            Text(
              "Add your details to login",
              style: TextStyle(
                  color: TColor.secondarytext,
                  fontWeight: FontWeight.w400,
                  fontSize: 15),
            ),
            SizedBox(
              height: media.height * 0.05,
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
            // Password input field
            RoundTextfield(
              hintText: "Password",
              controller: txtPassword,
              obscureText: true,
            ),
            SizedBox(
              height: media.height * 0.03,
            ),
            // login button
            RoundButton(onPressed: () {}, title: "Login"),
            SizedBox(
              height: media.height * 0.03,
            ),
            // forgot password text button
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ForgotPasswordView()));
              },
              child: Text(
                "Forgot your password?",
                style: TextStyle(
                    color: TColor.secondarytext,
                    fontWeight: FontWeight.w400,
                    fontSize: 20),
              ),
            ),
            SizedBox(
              height: media.height * 0.03,
            ),
            // login with text
            Text(
              "or Login With",
              style: TextStyle(
                  color: TColor.primarytext,
                  fontWeight: FontWeight.w400,
                  fontSize: 15),
            ),
            SizedBox(
              height: media.height * 0.03,
            ),
            // login with facebook
            RoundIconButton(
                title: "Login with Facebook",
                color: const Color(0xff367FC0),
                icon: 'assets/img/facebook-letter-logo.png',
                onPressed: () {}),
            SizedBox(
              height: media.height * 0.03,
            ),
            // login with google
            RoundIconButton(
                title: "Login with Google",
                color: const Color(0xffDD4B39),
                icon: 'assets/img/google-plus-logo.png',
                onPressed: () {}),
            SizedBox(
              height: media.height * 0.08,
            ),
            // text button for sign up
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpViwe()));
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Don't have an Account? ",
                    style: TextStyle(
                        color: TColor.primarytext,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  Text(
                    "Sign Up",
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
