import 'package:get/get.dart';
import 'package:learing_flutter/data/repository/popular_product_repo.dart';

import '../models/popular_models.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  PopularProductController({required this.popularProductRepo});
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    //**Successful */
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      print("Got the response ");
      update();
    } else {
      print("Got the else response " + response.statusCode.toString());
    }
  }
}