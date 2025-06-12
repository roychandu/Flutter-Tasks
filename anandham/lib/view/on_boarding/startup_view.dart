import 'package:anandham/view/login/welcome_view.dart';
import 'package:flutter/material.dart';

class StartupView extends StatefulWidget {
  const StartupView({super.key});

  @override
  State<StartupView> createState() => _StartupViewState();
}

class _StartupViewState extends State<StartupView> {
  @override
  void initState() {
    super.initState();
    goWelcomepage();
  }

  void goWelcomepage() async {
    await Future.delayed(const Duration(seconds: 5));
    welcomepage();
  }

  void welcomepage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const WelcomeView()));
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset("assets/img/splash_img.png",
              width: media.width, height: media.height, fit: BoxFit.cover),
          Image.asset("assets/img/images-removebg-preview.png",
              width: media.width * 0.8,
              height: media.height * 0.8,
              fit: BoxFit.contain),
        ],
      ),
    );
  }
}
