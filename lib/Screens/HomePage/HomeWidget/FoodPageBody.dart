import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:foody/Controller/PopularProductController.dart';
import 'package:foody/Helper/AppConstants.dart';
import 'package:foody/Models/productModel.dart';
import 'package:foody/Screens/FoodDetail/FoodDetail.dart';
import 'package:foody/Screens/FoodDetail/recommendedFoodDetail.dart';
import 'package:foody/Screens/HomePage/HomeWidget/Icon_and_text_widaget.dart';
import 'package:foody/Utils/Appcolor.dart';
import 'package:foody/Utils/Dimensions.dart';
import 'package:foody/Utils/Routes.dart';
import 'package:foody/Widget/BigText.dart';
import 'package:foody/Widget/SmallText.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var currPageValue = 0.0;
  double _scalFactor = 0.8;
  double _height = AppDimensions.pageViewContainer;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      //Slider

      GetBuilder<PopularProductController>(builder: (popularProducts) {
        return popularProducts.isloaded
            ? Container(
                height: AppDimensions.pageView,
                child: PageView.builder(
                    controller: pageController,
                    itemCount: popularProducts.popularProductList.isEmpty
                        ? 1
                        : popularProducts.popularProductList.length,
                    itemBuilder: (context, position) {
                      return InkWell(
                          onTap: () {},
                          child: _buildPageItem(
                              position, popularProducts.popularProductList));
                    }),
              )
            : Container(
                child: Center(
                    child: CircularProgressIndicator(
                  color: AppColors.mainColor,
                )),
              );
      }),

      SizedBox(
        height: 10,
      ),
      //Dotindicator

      GetBuilder<PopularProductController>(builder: (populproducts) {
        return DotsIndicator(
          dotsCount: populproducts.popularProductList.isEmpty
              ? 1
              : populproducts.popularProductList.length,
          position: currPageValue,
          decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: Size.square(9.0),
              activeSize: Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
        );
      }),

      //Popular Dish

      SizedBox(
        height: AppDimensions.heigth20,
      ),
      Container(
          margin: EdgeInsets.only(
            left: AppDimensions.heigth20,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(
                width: AppDimensions.width10,
              ),
              Container(
                  child:
                      BigText(text: ".", color: Colors.black26)), // Container
              SizedBox(
                width: AppDimensions.width10,
              ),
              Container(
                child: SmallText(
                  text: "Food pairing",
                  color: AppColors.textcolor,
                ),
              )
            ],
          )),
      //Images of Dish
      SizedBox(
        height: AppDimensions.height15,
      ),

      GetBuilder<PopularProductController>(builder: (product) {
        return product.isloaded
            ? ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: product.popularProductList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getRecomDetail(index));
                    },
                    child: Container(
                        margin: EdgeInsets.only(
                          left: AppDimensions.width20,
                          right: AppDimensions.width20,
                          bottom: AppDimensions.heigth10,
                        ),
                        child: Row(children: [
                          Container(
                            width: AppDimensions.imageSize,
                            height: AppDimensions.imageSize,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.heigth20),
                                color: product.popularProductList.length == null
                                    ? Colors.white38
                                    : Colors.black,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      product.popularProductList[index]
                                          ["image"],
                                    ))),
                          ),
                          SizedBox(
                            width: AppDimensions.width10,
                          ),
                          Expanded(
                              child: Container(
                            height: AppDimensions.listviewContSize,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BigText(
                                  text: product.popularProductList[index]
                                          ["title"]
                                      .toString(),
                                  size: AppDimensions.height15,
                                ),
                                SizedBox(
                                  height: AppDimensions.heigth10,
                                ),
                                SmallText(
                                    text: product.popularProductList[index]
                                            ["category"]
                                        .toString()),
                                SizedBox(
                                  height: AppDimensions.heigth10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon_and_Text(
                                      icon: Icons.circle_sharp,
                                      iconColor: AppColors.yellowColor,
                                      text: "Normal",
                                    ),
                                    Icon_and_Text(
                                        icon: Icons.location_on,
                                        iconColor: AppColors.mainColor,
                                        text: "1.7 Km"),
                                    Icon_and_Text(
                                        icon: Icons.access_time_outlined,
                                        iconColor: AppColors.iconcolor2,
                                        text: "32 min")
                                  ],
                                ),
                              ],
                            ),
                          ) // Padding
                              )
                        ])),
                  );
                })
            : CircularProgressIndicator(
                color: AppColors.mainColor,
              );
      })
    ]);
  }

  Widget _buildPageItem(
    int index,
    List popularProductList,
  ) {
    Matrix4 matrix4 = new Matrix4.identity();
    if (index == currPageValue.floor()) {
      var currScale = 1 - (currPageValue - index) * (1 - _scalFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == currPageValue.floor() + 1) {
      var currScale =
          _scalFactor + (currPageValue - index + 1) * (1 - _scalFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == currPageValue.floor() - 1) {
      var currScale = 1 - (currPageValue - index) * (1 - _scalFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scalFactor) / 2, 1);
    }
    return Transform(
        transform: matrix4,
        child: GetBuilder<PopularProductController>(
          builder: (
            products,
          ) {
            log(products.popularProductList[index]["image"].toString());
            return Stack(children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(RouteHelper.getFoodDetail(index));
                },
                child: Container(
                  height: _height,
                  margin: EdgeInsets.only(
                      left: AppDimensions.width10,
                      right: AppDimensions.width15),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppDimensions.radius30),
                      color: index.isEven
                          ? AppColors.yellowColor
                          : AppColors.mainColor,
                      image: DecorationImage(
                          image: NetworkImage(products.popularProductList[index]
                                  ["image"]
                              .toString()),
                          fit: BoxFit.cover)),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: AppDimensions.pagesmallContaiber,
                  margin: EdgeInsets.only(
                      left: AppDimensions.heigth20,
                      right: AppDimensions.heigth20,
                      bottom: AppDimensions.heigth10),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 5),
                            color: Color(0xFFe8e8e8),
                            blurRadius: 5),
                        BoxShadow(
                          offset: Offset(-5, 0),
                          color: Colors.white,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white),
                  child: Container(
                    padding: EdgeInsets.only(
                        top: AppDimensions.height15,
                        left: AppDimensions.height15,
                        right: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(
                          text: products.popularProductList[index]["title"]
                              .toString(),
                        ),
                        SizedBox(
                          height: AppDimensions.heigth10,
                        ),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(
                                  products.popularProductList[index]["rating"]
                                          ["rate"]
                                      .toInt(),
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
                              text: products.popularProductList[index]["rating"]
                                      ["rate"]
                                  .toString(),
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
                ),
              ),
            ]);
          },
        ));
  }
}
