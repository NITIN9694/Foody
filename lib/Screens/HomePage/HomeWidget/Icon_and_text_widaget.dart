import 'package:flutter/material.dart';
import 'package:foody/Utils/Appcolor.dart';
import 'package:foody/Widget/SmallText.dart';

class Icon_and_Text extends StatelessWidget {
  final IconData icon;
  final String text;

  final Color iconColor;

  const Icon_and_Text(
      {Key? key,
      required this.icon,
      required this.iconColor,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        SizedBox(
          width: 5,
        ),
        SmallText(
          text: text,
          color: AppColors.textcolor,
          size: 12,
        )
      ],
    );
  }
}
