import 'package:flutter/material.dart';
import 'package:learing_flutter/widgets/small_text.dart';

import '../models/popular_models.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppItemBrief extends StatelessWidget {
  final ProductModel productModel;

  AppItemBrief({Key? key, required this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: productModel.name!,
          size: Dimensions.fontSize26,
        ),
        SizedBox(height: Dimensions.height10),
        //**COmments section */
        Row(
          children: [
            Wrap(
              children: List.generate(
                  productModel.stars!,
                  (index) => Icon(
                        Icons.star,
                        color: AppColors.mainColor,
                        size: Dimensions.height15,
                      )),
            ),
            SizedBox(width: Dimensions.width10),
            SmallText(text: productModel.stars.toString()!),
            SizedBox(width: Dimensions.width10),
            SmallText(text: "1287"),
            SizedBox(width: Dimensions.width10),
            SmallText(text: "Comments")
          ],
        ),
        SizedBox(height: Dimensions.height20),
        //**Time and Distance */
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
              icon: Icons.circle_sharp,
              text: "Normal",
              iconColor: AppColors.iconColor1,
            ),
            IconAndTextWidget(
              icon: Icons.location_on,
              text: "China",
              iconColor: AppColors.mainColor,
            ),
            IconAndTextWidget(
              icon: Icons.access_time_rounded,
              text: productModel.createdAt!,
              iconColor: AppColors.iconColor2,
            ),
          ],
        )
      ],
    );
  }
}
