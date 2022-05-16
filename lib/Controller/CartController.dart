import 'package:foody/Controller/PopularProductController.dart';
import 'package:foody/Data/Repository/CartRepo.dart';
import 'package:foody/Models/productModel.dart';
import 'package:get/get.dart';

import '../Models/CartModel.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  Map<int, CartModel> _item = {};

  void addItem(int quantity, ProductModel productModel, int index) {
    var product = Get.find<PopularProductController>().popularProductList;
    print("adding item to the cart " +
        product[index]["id"].toString() +
        "quantity");

    _item.putIfAbsent(
        product[index]["id"],
        () => CartModel(
              id: product[index]["id"],
              title: product[index]["title"],
              price: product[index]["price"],
              image: product[index]["image"],
              quantity: quantity,
              isExit: true,
            ));
  }
}
