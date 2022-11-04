import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:learing_flutter/controller/popular_product_controller.dart';
import 'package:learing_flutter/controller/recommended_product_controller.dart';
import 'package:learing_flutter/pages/food/popular_food_details.dart';
import 'package:learing_flutter/pages/food/recommended_food_details.dart';
import 'package:learing_flutter/pages/home/main_food_page.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  //** Below this method will ensure that
  //** the dependencies are initialized */
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          MainFoodPage(), //RecommendedFoodDetail(), //PopularFoodDetail(), //MainFoodPage(),
    );
  }
}
