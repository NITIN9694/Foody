import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:foody/Controller/CartController.dart';
import 'package:foody/Controller/PopularProductController.dart';
import 'package:foody/Screens/FoodDetail/FoodDetailesWidget/expanded_text_widget.dart';
import 'package:foody/Screens/HomePage/HomeWidget/Icon_and_text_widaget.dart';
import 'package:foody/Screens/HomePage/Homepage.dart';
import 'package:foody/Utils/AppColumn.dart';
import 'package:foody/Utils/Appcolor.dart';
import 'package:foody/Utils/Dimensions.dart';
import 'package:foody/Widget/AppIcon.dart';
import 'package:foody/Widget/BigText.dart';
import 'package:foody/Widget/SmallText.dart';
import 'package:get/get.dart';

class FoodDetail extends StatelessWidget {
  int pageId;
  FoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(Get.find<CartController>());

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
                            image: NetworkImage(
                              product["image"],
                            ))),
                  )),
              Positioned(
                top: AppDimensions.height15,
                left: AppDimensions.width20,
                right: AppDimensions.width20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(HomePage());
                      },
                      child: AppIcon(
                        iconData: Icons.arrow_back_ios,
                      ),
                    ),
                    GestureDetector(
                        onTap: () {},
                        child: AppIcon(
                            iconData: Icons.shopping_cart_checkout_outlined))
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
                        AppColumn(
                          text: product["title"].toString(),
                        ),
                        SizedBox(
                          height: AppDimensions.heigth20,
                        ),
                        BigText(text: "Introduce"),
                        Expanded(
                          child: SingleChildScrollView(
                            child: ExpandebleTextWidget(
                                text: product["description"].toString()),
                          ),
                        )
                      ],
                    )),
              )
            ]),
            bottomNavigationBar: GetBuilder<PopularProductController>(
              builder: (popularProductController) {
                log(popularProductController.quantity.toString());
                return Container(
                    height: AppDimensions.bottomHeightBar,
                    padding: EdgeInsets.only(
                        top: AppDimensions.heigth20,
                        bottom: AppDimensions.heigth20,
                        left: AppDimensions.width10,
                        right: AppDimensions.width10),
                    decoration: BoxDecoration(
                        color: AppColors.buttonColor,
                        borderRadius: BorderRadius.only(
                            topLeft:
                                Radius.circular(AppDimensions.radius20 * 2),
                            topRight:
                                Radius.circular(AppDimensions.radius20 * 2))),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                top: AppDimensions.heigth20,
                                bottom: AppDimensions.heigth20,
                                left: AppDimensions.width10,
                                right: AppDimensions.width10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.radius20),
                                color: Colors.white), // BoxDecoration
                            child: Row(children: [
                              GestureDetector(
                                onTap: () {
                                  popularProductController.setQuantity(false);
                                },
                                child: Icon(
                                  Icons.remove,
                                  color: AppColors.signColor,
                                ),
                              ),
                              SizedBox(
                                width: AppDimensions.width10 / 2,
                              ),
                              BigText(
                                  text: popularProductController.quantity
                                      .toString()),
                              SizedBox(
                                width: AppDimensions.width10 / 2,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    popularProductController.setQuantity(true);
                                  },
                                  child: Icon(Icons.add,
                                      color: AppColors.signColor)),
                            ]),
                          ),
                          GestureDetector(
                            onTap: () {
                              popularProductController.addItem(product, pageId);
                            },
                            child: Container(
                                padding: EdgeInsets.only(
                                    top: AppDimensions.heigth20,
                                    bottom: AppDimensions.heigth20,
                                    left: AppDimensions.width10,
                                    right: AppDimensions.width10),
                                child: BigText(
                                  text: product["price"].toString(),
                                  color: Colors.white,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        AppDimensions.radius20),
                                    color: AppColors.mainColor)),
                          ),
                        ]));
              },
            )));
  }
}
