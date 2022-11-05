import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learing_flutter/controller/popular_product_controller.dart';
import 'package:learing_flutter/pages/home/food_page_body.dart';
import 'package:learing_flutter/pages/home/main_food_page.dart';
import 'package:learing_flutter/routes/route_helper.dart';
import 'package:learing_flutter/utils/app_constants.dart';
import 'package:learing_flutter/utils/colors.dart';
import 'package:learing_flutter/utils/dimensions.dart';
import 'package:learing_flutter/utils/dummy_text.dart';
import 'package:learing_flutter/widgets/app_icon.dart';
import 'package:learing_flutter/widgets/app_item_brief.dart';
import 'package:learing_flutter/widgets/big_text.dart';
import 'package:learing_flutter/widgets/expandable_text.dart';

class PopularFoodDetail extends StatelessWidget {
  int pageId;
  PopularFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var popularProduct =
        Get.find<PopularProductController>().popularProductList[pageId];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //** Popular food Image */
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      AppConstants.IMAGE_BASE_URL + popularProduct.img!),
                ),
              ),
            ),
          ),
          //** Popular food top bar */
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (() {
                    Get.toNamed(RouteHelper.getInitial());
                  }),
                  child: AppIcon(icon: Icons.arrow_back_ios),
                ),
                GestureDetector(
                  onTap: (() {}),
                  child: AppIcon(icon: Icons.shopping_bag_outlined),
                ),
              ],
            ),
          ),
          //** Introduction of Food  */
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImgSize - Dimensions.height20,
            child: Container(
              padding: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                top: Dimensions.width20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.borderRadius20),
                  topLeft: Radius.circular(Dimensions.borderRadius20),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //** App item brief panel*/
                  AppItemBrief(
                    productModel: popularProduct,
                  ),
                  SizedBox(height: Dimensions.height20),
                  BigText(text: "Introduction"),
                  SizedBox(height: Dimensions.height20),
                  //** Expandable text widget */
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableText(text: popularProduct.description!),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      //** Bottom Navigation bar */
      bottomNavigationBar: Container(
        height: Dimensions.height120,
        padding: EdgeInsets.only(
          top: Dimensions.height30,
          bottom: Dimensions.height30,
          left: Dimensions.width20,
          right: Dimensions.width20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.borderRadius20 * 2),
            topRight: Radius.circular(Dimensions.borderRadius20 * 2),
          ),
          color: AppColors.buttonBGColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: Dimensions.height20,
                bottom: Dimensions.height20,
                left: Dimensions.width20,
                right: Dimensions.width20,
              ),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(Dimensions.borderRadius20),
                  color: Colors.white),
              child: Row(
                children: [
                  Icon(Icons.remove, color: AppColors.signColor),
                  SizedBox(width: Dimensions.width10 / 2),
                  BigText(text: "0"),
                  SizedBox(width: Dimensions.width10 / 2),
                  Icon(Icons.add, color: AppColors.signColor),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: Dimensions.height20,
                bottom: Dimensions.height20,
                left: Dimensions.width20,
                right: Dimensions.width20,
              ),
              child: BigText(
                text: "\$ ${popularProduct.price!} | Add to Cart",
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.borderRadius20),
                color: AppColors.mainColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
