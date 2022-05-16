import 'dart:developer';

import 'package:foody/Models/productModel.dart';
import 'package:get/get.dart';

import '../Data/Repository/PopularProductRepo.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];

  List<dynamic> get popularProductList => _popularProductList;

  bool _isload = false;
  bool get isloaded => _isload;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      print("Heyyyyy");
      _popularProductList = [];

      _popularProductList.addAll(response.body);
      _isload = true;
      log(popularProductList.length.toString());
      update();
    } else {}
  }
}
