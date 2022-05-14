import 'package:flutter/gestures.dart';
import 'package:get/get.dart';

class AppDimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageViewContainer = screenHeight / 3.84;
  static double pageView = screenHeight / 2.64;
  static double pageViewTextContainer = screenHeight / 7.03;
  static double pagesmallContaiber = screenHeight / 6;

  //Dyanmic height padding and margin
  static double heigth10 = screenHeight / 84.4;
  static double heigth20 = screenHeight / 42.2;
  static double height15 = screenHeight / 56.27;
  static double height45 = screenHeight / 18.76;

  //Dyanmic width padding and margin
  static double width10 = screenWidth / 84.4;
  static double width20 = screenWidth / 42.2;
  static double width15 = screenWidth / 56.27;

  static double font20 = screenHeight / 42.2;
  static double font12 = screenHeight / 60;
  static double font10 = screenHeight / 65;
  static double font26 = screenHeight / 32.46;
  static double font16 = screenHeight / 52.76;

  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.1;

  //Icon Search
  static double icon24 = screenHeight / 35.17;

  //Imgageheight
  static double imageSize = screenHeight / 5.04;
  static double listviewContSize = screenHeight / 3.04;

  static double popularFoodimgSize = screenHeight / 2.14;
  static double iconSize16 = screenHeight / 52.75;

  static double bottomHeightBar = screenHeight / 7.03;
}
