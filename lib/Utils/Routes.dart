import 'package:foody/Screens/FoodDetail/FoodDetail.dart';
import 'package:foody/Screens/FoodDetail/recommendedFoodDetail.dart';
import 'package:foody/Screens/HomePage/Homepage.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularfood = "/popular-food";
  static const String recom = "/recom-food";

  static String getFoodDetail(int pageId) => '$popularfood?pageId=$pageId';
  static String getRecomDetail(int pageId) => '$recom?pageId=$pageId';

  static List<GetPage> routes = [
    GetPage(
        name: initial, transition: Transition.fadeIn, page: () => HomePage()),
    GetPage(
        name: popularfood,
        transition: Transition.fadeIn,
        page: () {
          var pageID = Get.parameters['pageId'];
          return FoodDetail(pageId: int.parse(pageID!));
        }),
    GetPage(
        name: recom,
        transition: Transition.fadeIn,
        page: () {
          var pageID = Get.parameters['pageId'];
          return recommendedFoodDetail(pageid: int.parse(pageID!));
        }),
  ];
}
