import 'package:anandham/view/login/login_view.dart';
import 'package:anandham/view/login/sign_up_viwe.dart';
import 'package:flutter/material.dart';
import 'package:anandham/common_widget/round_button.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(),
          Image.asset("assets/img/Organe top shape.png"),
          Positioned(
            top: media.height * 0.45,
            left:
                (media.width - (media.width * 0.55)) / 2, // Center horizontally

            child: Image.asset(
              "assets/img/images-removebg-preview.png",
              width: media.width * 0.55,
            ),
          ),
          Positioned(
            top: media.height * 0.7,
            left: (media.width - (media.width * 0.8)) / 2,
            child: SizedBox(
              width: media.width * 0.8,
              child: const Text(
                "Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
                softWrap: true,
              ),
            ),
          ),
          Positioned(
              top: media.height * 0.8,
              left: (media.width - (media.width * 0.8)) / 2,
              child: RoundButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginView()));
                  },
                  title: "Login",
                  type: RoundButtonType.bgprimary)),
          Positioned(
              top: media.height * 0.9,
              left: (media.width - (media.width * 0.8)) / 2,
              child: RoundButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpViwe()));
                  },
                  title: "Create an Account",
                  type: RoundButtonType.textprimary)),
        ],
      ),
    );
  }
}
