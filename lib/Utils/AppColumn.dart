import 'package:flutter/material.dart';
import 'package:foody/Screens/HomePage/HomeWidget/Icon_and_text_widaget.dart';
import 'package:foody/Utils/Appcolor.dart';
import 'package:foody/Utils/Dimensions.dart';
import 'package:foody/Widget/BigText.dart';
import 'package:foody/Widget/SmallText.dart';

class AppColumn extends StatelessWidget {
  final String text;

  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: AppDimensions.font26,
        ),
        SizedBox(
          height: AppDimensions.heigth10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                  5,
                  (index) => Icon(
                        Icons.star,
                        size: 16,
                        color: AppColors.mainColor,
                      )),
            ),
            SizedBox(
              width: AppDimensions.width10,
            ),
            SmallText(
              text: "4.5",
              color: AppColors.textcolor,
            ),
            SizedBox(
              width: AppDimensions.width10,
            ),
            SmallText(
              text: "1287",
              size: 10,
              color: AppColors.textcolor,
            ),
            SizedBox(
              width: AppDimensions.width10,
            ),
            SmallText(
              text: "Comments",
              size: 10,
              color: AppColors.textcolor,
            ),
          ],
        ),
        SizedBox(
          height: AppDimensions.heigth20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon_and_Text(
                icon: Icons.circle_sharp,
                iconColor: AppColors.yellowColor,
                text: "Normal"),
            Icon_and_Text(
                icon: Icons.location_on,
                iconColor: AppColors.mainColor,
                text: "1.7 Km"),
            Icon_and_Text(
                icon: Icons.access_time_outlined,
                iconColor: AppColors.iconcolor2,
                text: "32 min")
          ],
        )
      ],
    );
  }
}
