import 'package:flutter/material.dart';
import 'package:foody/Utils/Dimensions.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  double height;

  SmallText(
      {Key? key,
      this.color,
      required this.text,
      this.size = 0,
      this.height = 1.2})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size == 0 ? AppDimensions.font12 : size,
          height: height,
          color: color,
          fontWeight: FontWeight.w400),
    );
  }
}
