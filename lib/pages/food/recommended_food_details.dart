import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learing_flutter/controller/recommended_product_controller.dart';
import 'package:learing_flutter/routes/route_helper.dart';
import 'package:learing_flutter/utils/app_constants.dart';
import 'package:learing_flutter/utils/colors.dart';
import 'package:learing_flutter/utils/dimensions.dart';
import 'package:learing_flutter/utils/dummy_text.dart';
import 'package:learing_flutter/widgets/app_icon.dart';
import 'package:learing_flutter/widgets/big_text.dart';
import 'package:learing_flutter/widgets/expandable_text.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;

  RecommendedFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var recommendedProduct =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: (Dimensions.height20 * 4),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(icon: Icons.clear),
                ),
                GestureDetector(
                  child: AppIcon(icon: Icons.shopping_bag_outlined),
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(Dimensions.height20),
              child: Container(
                child: Center(
                  child: BigText(
                    size: Dimensions.fontSize26,
                    text: recommendedProduct.name!,
                  ),
                ),
                width: double.maxFinite,
                padding: EdgeInsets.only(
                  top: Dimensions.height5,
                  bottom: Dimensions.height10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.borderRadius20),
                    topRight: Radius.circular(Dimensions.borderRadius20),
                  ),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: (Dimensions.height100 * 3),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.IMAGE_BASE_URL + recommendedProduct.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  child: ExpandableText(text: recommendedProduct.description!),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //** Bottom add remove panel */
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20 * 2.5,
              right: Dimensions.width20 * 2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppIcon(
                  iconSize: Dimensions.iconSize24,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  icon: Icons.remove,
                ),
                BigText(
                  text: "\$ ${recommendedProduct.price!} " + "X" + " 0",
                  color: AppColors.mainBlackColor,
                  size: Dimensions.fontSize26,
                ),
                AppIcon(
                  iconSize: Dimensions.iconSize24,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  icon: Icons.add,
                ),
              ],
            ),
          ),
          //** Bottom Add to cart panel */
          Container(
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
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: AppColors.mainColor,
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
                    text: "\$ ${recommendedProduct.price!} | Add to Cart",
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimensions.borderRadius20),
                    color: AppColors.mainColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
