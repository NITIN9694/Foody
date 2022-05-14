import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foody/Utils/Appcolor.dart';
import 'package:foody/Utils/Dimensions.dart';
import 'package:foody/Widget/SmallText.dart';

class ExpandebleTextWidget extends StatefulWidget {
  String text;
  ExpandebleTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandebleTextWidget> createState() => _ExpandebleTextWidgetState();
}

class _ExpandebleTextWidgetState extends State<ExpandebleTextWidget> {
  late String firstHalf;
  late String SecondHalf;

  bool hiddenText = true;
  double textHeight = AppDimensions.screenHeight / 5.63;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      SecondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      SecondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SecondHalf.isEmpty
          ? SmallText(
              size: AppDimensions.font16,
              color: AppColors.textcolor,
              text: firstHalf)
          : Column(
              children: [
                SmallText(
                    height: 1.8,
                    size: AppDimensions.font16,
                    color: AppColors.textcolor,
                    text: hiddenText
                        ? (firstHalf + "...")
                        : (firstHalf + SecondHalf)),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(
                        text: "Show more",
                        color: AppColors.mainColor,
                      ),
                      Icon(
                        hiddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: AppColors.mainColor,
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
