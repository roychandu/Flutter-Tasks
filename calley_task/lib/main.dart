import 'package:calley_task/screens/language_screen.dart';
import 'package:calley_task/screens/login%20and%20register%20screens/otp_screen.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(scaffoldBackgroundColor: Color(0xffF8FAFC)),
      home: LanguageScreen(),
    );
  }
}
