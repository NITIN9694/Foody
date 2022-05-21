import 'package:foody/Controller/PopularProductController.dart';
import 'package:foody/Data/Repository/CartRepo.dart';
import 'package:foody/Models/productModel.dart';
import 'package:get/get.dart';

import '../Models/CartModel.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  Map<int, CartModel> _item = {};
  Map<int, CartModel> get item => _item;

  void addItem(int quantity, ProductModel productModel) {
    var product = Get.find<PopularProductController>().popularProductList;
    if (_item.containsKey(productModel.id)) {
      _item.update(productModel.id!, (value) {
        return CartModel(
          id: value.id,
          title: value.title,
          price: value.price,
          image: value.image,
          quantity: value.quantity! + quantity,
          isExit: true,
        );
      });
    } else {
      _item.putIfAbsent(
          productModel.id!,
          () => CartModel(
                id: productModel.id,
                title: productModel.title,
                price: productModel.price,
                image: productModel.image,
                quantity: quantity,
                isExit: true,
              ));
    }
  }

  //for exitsing cart

  bool existIncart(ProductModel product) {
    if (_item.containsKey(product.id)) {
      return true;
    }
    return false;
  }

  //for  addquantityitem
  int getQuantity(ProductModel product) {
    var quantity = 0;
    if (_item.containsKey(product.id)) {
      _item.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  //for TotalItem
//  int get totoalItem{
//    var
//  }

//getcartitem
  List<CartModel> get getItem {
    return _item.entries.map((e) {
      return e.value;
    }).toList();
  }
}
