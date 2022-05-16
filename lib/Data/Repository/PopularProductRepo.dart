import 'package:foody/Data/Api/ApiClient.dart';
import 'package:foody/Helper/AppConstants.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData(AppConstant.Product_URL);
  }
}
