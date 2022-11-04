import 'package:get/get.dart';
import 'package:learing_flutter/data/api/api_client.dart';
import 'package:learing_flutter/utils/app_constants.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;

  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async {
    print("Got the RecommendedProductRepo getPopularProductList ");
    return apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI);
  }
}
