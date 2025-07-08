import 'package:flutter/material.dart';

class CustomInputTextWithVisiable extends StatelessWidget {
  String hint;
  TextEditingController controller;
  Icon icon;
  CustomInputTextWithVisiable({
    super.key,
    required this.hint,
    required this.controller,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        suffixIcon: icon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        labelText: hint,
        labelStyle: TextStyle(color: Colors.black, fontSize: 16),
        contentPadding: EdgeInsets.only(left: 20),
      ),
    );
  }
}
