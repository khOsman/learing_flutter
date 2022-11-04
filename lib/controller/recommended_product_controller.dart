import 'package:get/get.dart';
import 'package:learing_flutter/data/repository/popular_product_repo.dart';
import 'package:learing_flutter/data/repository/recommended_product_repo.dart';

import '../models/popular_models.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;

  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;
  RecommendedProductController({required this.recommendedProductRepo});
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    Response response =
        await recommendedProductRepo.getRecommendedProductList();
    //**Successful */
    if (response.statusCode == 200) {
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      print("Got the response ");
      update();
    } else {
      print("Got the else response " + response.statusCode.toString());
    }
  }
}
