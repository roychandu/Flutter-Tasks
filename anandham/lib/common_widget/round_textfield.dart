import 'package:flutter/material.dart';
import 'package:anandham/common/color_extension.dart';

class RoundTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final TextInputType? keyboardType;
  final bool obscureText;

  const RoundTextfield(
      {super.key,
      required this.hintText,
      this.controller,
      this.keyboardType,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Container(
      width: media.width * 0.80,
      decoration: BoxDecoration(
          color: TColor.placeholder, borderRadius: BorderRadius.circular(25)),
      child: TextField(
        autocorrect: false,
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
                color: TColor.primarytext,
                fontSize: 14,
                fontWeight: FontWeight.w500)),
      ),
    );
  }
}
