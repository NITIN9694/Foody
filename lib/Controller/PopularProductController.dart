import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:foody/Controller/CartController.dart';
import 'package:foody/Models/CartModel.dart';
import 'package:foody/Models/productModel.dart';
import 'package:foody/Utils/Appcolor.dart';
import 'package:get/get.dart';

import '../Data/Repository/PopularProductRepo.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];

  List<dynamic> get popularProductList => _popularProductList;

  bool _isload = false;
  bool get isloaded => _isload;

  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItem = 0;
  int get inCartItem => _inCartItem + _quantity;

  late CartController _cart;

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

  void setQuantity(bool isIncreament) {
    if (isIncreament) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if (quantity < 0) {
      Get.snackbar("Item count", "You can't reduce more !",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return 0;
    } else if (quantity > 20) {
      Get.snackbar("Item count", "You can't add more !",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return 20;
    } else {
      return quantity;
    }
  }

  Map<int, CartModel> _item = {};
  Map<int, CartModel> get item => _item;

  void initProduct(CartController cartController, ProductModel product) {
    _quantity = 0;
    _inCartItem = 0;
    _cart = cartController;
    var exist = false;
    exist = _cart.existIncart(product);
    //if exist
    //get from storage _incartitem
    print(exist.toString());
    if (exist) {
      _inCartItem = _cart.getQuantity(product);
    }
    print(_inCartItem.toString());
  }

  void addItem(
    ProductModel productModel,
  ) {
    if (_quantity > 0) {
      _cart.addItem(quantity, productModel);
      _quantity = 0;
      _cart.item.forEach((key, value) {
        print(value.id.toString() + " " + value.quantity.toString());
      });
    } else {}
  }
}
