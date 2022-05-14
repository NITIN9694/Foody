import 'package:flutter/material.dart';
import 'package:foody/Screens/FoodDetail/FoodDetail.dart';
import 'package:foody/Screens/FoodDetail/recommendedFoodDetail.dart';
import 'package:foody/Screens/HomePage/Homepage.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Foody',
      theme: ThemeData(),
      home: HomePage(),
    );
  }
}
