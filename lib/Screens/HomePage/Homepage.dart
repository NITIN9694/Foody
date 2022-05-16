import 'package:flutter/material.dart';
import 'package:foody/Screens/HomePage/HomeWidget/FoodPageBody.dart';
import 'package:foody/Utils/Appcolor.dart';
import 'package:foody/Utils/Dimensions.dart';
import 'package:foody/Widget/BigText.dart';
import 'package:foody/Widget/SmallText.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    print("Height " + MediaQuery.of(context).size.height.toString());
    return Scaffold(
      body: Column(
        children: [
          Container(
              child: Container(
            margin: EdgeInsets.only(
                top: AppDimensions.height45, bottom: AppDimensions.height15),
            padding: EdgeInsets.only(
                left: AppDimensions.width20, right: AppDimensions.width20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(
                      text: "Country",
                      color: AppColors.mainColor,
                    ),
                    Row(
                      children: [
                        SmallText(
                          size: 15,
                          text: "City",
                          color: Colors.black54,
                        ),
                        Icon(Icons.arrow_drop_down_rounded)
                      ],
                    ),
                  ],
                ),
                Container(
                    height: AppDimensions.height45,
                    width: AppDimensions.height45,
                    child: Icon(
                      Icons.search,
                      size: AppDimensions.icon24,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(15),
                    ))
              ],
            ),
          )),
          Expanded(child: SingleChildScrollView(child: 
          FoodPageBody()))
        ],
      ),
    );
  }
}
