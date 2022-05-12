import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  double height;

  SmallText(
      {Key? key,
      this.color,
      required this.text,
      this.size = 12,
      this.height = 1.2})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      style: TextStyle(
          fontSize: size,
          height: height,
          color: color,
          fontWeight: FontWeight.w400),
    );
  }
}
