import 'package:flutter/material.dart';
import 'package:learing_flutter/utils/colors.dart';
import 'package:learing_flutter/widgets/big_text.dart';
import 'package:learing_flutter/widgets/food_page_body.dart';
import 'package:learing_flutter/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 45, bottom: 45),
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  BigText(
                    text: "Bangladesh",
                  ),
                  Row(
                    children: [
                      SmallText(
                        text: "Narayanganj",
                        color: AppColors.textColor,
                      ),
                      const Icon(Icons.arrow_drop_down_rounded),
                    ],
                  ),
                ],
              ),
              Center(
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.mainColor,
                  ),
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        FoodPageBody(),
      ],
    ));
  }
}
