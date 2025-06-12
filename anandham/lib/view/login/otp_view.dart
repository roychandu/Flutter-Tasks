import 'package:anandham/common_widget/round_button.dart';
import 'package:flutter/material.dart';
import 'package:anandham/common/color_extension.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
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
              height: media.height * 0.07,
            ),
            // text
            Align(
              alignment: const AlignmentDirectional(0.0, -1.0),
              child: Text(
                "We have sent an OTP to your Mobile",
                textAlign: TextAlign.center,
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
                "Please check your mobile number xxxxx xxxxx continue to reset your password",
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

            SizedBox(
              height: media.height * 0.03,
            ),
            // Send button
            RoundButton(onPressed: () {}, title: "Next"),
            SizedBox(
              height: media.height * 0.03,
            ),
            // Again otp send text button
            TextButton(
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Didn't Receive? ",
                    style: TextStyle(
                        color: TColor.primarytext,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  Text(
                    "Click Here",
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
