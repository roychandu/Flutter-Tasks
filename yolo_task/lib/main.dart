import 'package:flutter/material.dart';
import 'package:yolo_task/screens/card_freez.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: CardFreez());
  }
}
