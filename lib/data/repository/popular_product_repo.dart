import 'package:get/get.dart';
import 'package:learing_flutter/data/api/api_client.dart';
import 'package:learing_flutter/utils/app_constants.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    print("Got the getPopularProductList ");
    return apiClient.getData(AppConstants.POPULAR_PRODUCT_URI);
  }
}
