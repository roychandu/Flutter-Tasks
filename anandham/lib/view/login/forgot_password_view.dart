import 'package:anandham/common_widget/round_button.dart';
import 'package:anandham/common_widget/round_textfield.dart';
import 'package:flutter/material.dart';
import 'package:anandham/common/color_extension.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final TextEditingController txtEmail = TextEditingController();

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
            // Reset text
            Align(
              alignment: const AlignmentDirectional(0.0, -1.0),
              child: Text(
                "Reset Password",
                style: TextStyle(
                    color: TColor.primary,
                    fontWeight: FontWeight.w800,
                    fontSize: 40),
              ),
            ),
            // Detail text
            SizedBox(
              width: media.width * 0.9,
              child: Text(
                "Please enter your email to receive a link to create a new password via email",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: TColor.secondarytext,
                    fontWeight: FontWeight.w400,
                    fontSize: 15),
              ),
            ),
            SizedBox(
              height: media.height * 0.05,
            ),
            // Email text
            RoundTextfield(
              hintText: "Email",
              controller: txtEmail,
            ),
            SizedBox(
              height: media.height * 0.03,
            ),
            // Send button
            RoundButton(onPressed: () {}, title: "Send"),
          ],
        ),
      ),
    );
  }
}
