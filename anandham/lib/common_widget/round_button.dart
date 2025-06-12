import 'package:flutter/material.dart';
import 'package:anandham/common/color_extension.dart';

enum RoundButtonType { bgprimary, textprimary }

class RoundButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final RoundButtonType type;
  const RoundButton(
      {super.key,
      required this.onPressed,
      required this.title,
      this.type = RoundButtonType.bgprimary});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return InkWell(
      onTap: onPressed,
      child: Container(
        width: media.width * 0.8,
        height: media.height * 0.07,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: type == RoundButtonType.bgprimary
              ? null
              : Border.all(color: TColor.primary, width: 1),
          color:
              type == RoundButtonType.bgprimary ? TColor.primary : Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            color: type == RoundButtonType.bgprimary
                ? Colors.white
                : TColor.primary,
          ),
        ),
      ),
    );
  }
}
