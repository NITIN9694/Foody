import 'package:flutter/material.dart';
import 'package:foody/Screens/HomePage/HomeWidget/Icon_and_text_widaget.dart';
import 'package:foody/Utils/Appcolor.dart';
import 'package:foody/Utils/Dimensions.dart';
import 'package:foody/Widget/AppIcon.dart';
import 'package:foody/Widget/BigText.dart';
import 'package:foody/Widget/SmallText.dart';

class FoodDetail extends StatelessWidget {
  const FoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: AppDimensions.popularFoodimgSize,
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                    // ignore: prefer_const_constructors
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        // ignore: prefer_const_constructors
                        image: AssetImage(
                          "assets/pizza.jpg",
                        ))),
              )),
          Positioned(
            top: AppDimensions.height15,
            left: AppDimensions.width20,
            right: AppDimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  iconData: Icons.arrow_back_ios,
                ),
                AppIcon(iconData: Icons.shopping_cart_checkout_outlined)
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: AppDimensions.popularFoodimgSize - 20,
            child: Container(
              padding: EdgeInsets.only(
                  left: AppDimensions.width20,
                  right: AppDimensions.width20,
                  top: AppDimensions.height15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppDimensions.radius20),
                      topRight: Radius.circular(AppDimensions.radius20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                    text: "Chinese Side",
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
              ),
            ),
          )
        ]),
      ),
    );
  }
}
