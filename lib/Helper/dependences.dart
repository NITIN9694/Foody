import 'package:foody/Controller/CartController.dart';
import 'package:foody/Controller/PopularProductController.dart';
import 'package:foody/Data/Api/ApiClient.dart';
import 'package:foody/Data/Repository/CartRepo.dart';
import 'package:foody/Data/Repository/PopularProductRepo.dart';
import 'package:foody/Helper/AppConstants.dart';
import 'package:get/get.dart';

Future<void> init() async {
//Api Client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstant.Base_URL));

//Repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());

//controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
