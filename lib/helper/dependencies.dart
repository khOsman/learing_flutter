import 'package:get/get.dart';
import 'package:learing_flutter/controller/popular_product_controller.dart';
import 'package:learing_flutter/controller/recommended_product_controller.dart';
import 'package:learing_flutter/data/api/api_client.dart';
import 'package:learing_flutter/data/repository/popular_product_repo.dart';
import 'package:learing_flutter/data/repository/recommended_product_repo.dart';
import 'package:learing_flutter/utils/app_constants.dart';

Future<void> init() async {
  //**API client */
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));
  //**API repositories */
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  //**API controllers */
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
}
