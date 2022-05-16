import 'package:flutter/material.dart';
import 'package:foody/Controller/PopularProductController.dart';
import 'package:foody/Screens/FoodDetail/FoodDetail.dart';
import 'package:foody/Screens/FoodDetail/recommendedFoodDetail.dart';
import 'package:foody/Screens/HomePage/Homepage.dart';
import 'package:foody/Utils/Routes.dart';
import 'package:get/get.dart';
import 'Helper/dependences.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    return GetMaterialApp(
      title: 'Foody',
      theme: ThemeData(),
      home: HomePage(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}
