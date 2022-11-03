import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learing_flutter/utils/colors.dart';
import 'package:learing_flutter/utils/dimensions.dart';
import 'package:learing_flutter/widgets/big_text.dart';
import 'package:learing_flutter/widgets/icon_and_text_widget.dart';
import 'package:learing_flutter/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  var _height = Dimensions.pageViewContainer;
  PageController pageController = PageController(viewportFraction: 0.85);

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      //** Slider Section*/
      Container(
        // color: Colors.redAccent,
        height: Dimensions.pageView,
        child: PageView.builder(
          controller: pageController,
          itemCount: 5,
          itemBuilder: (context, index) {
            return _buildPageItem(index);
          },
        ),
      ),
      //** Dots */
      new DotsIndicator(
        dotsCount: 5,
        position: _currPageValue,
        decorator: DotsDecorator(
          activeColor: AppColors.mainColor,
          size: Size.square(Dimensions.dotSize9),
          activeSize: Size(Dimensions.dotSize18, Dimensions.dotSize9),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimensions.borderRadius5)),
        ),
      ),
      //** Popular Items*/
      SizedBox(height: Dimensions.height30),
      Container(
        margin: EdgeInsets.only(left: Dimensions.width30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BigText(
              text: "Popular",
              color: AppColors.mainBlackColor,
            ),
            SizedBox(width: Dimensions.width10),
            Container(
              margin: EdgeInsets.only(bottom: Dimensions.height3),
              child: BigText(
                text: ".",
                color: Colors.black26,
              ),
            ),
            SizedBox(width: Dimensions.width10),
            Container(
              margin: EdgeInsets.only(bottom: Dimensions.height2),
              child: SmallText(
                text: "Food pairing",
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      // matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      // matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.borderRadius30),
              color:
                  index % 2 == 0 ? AppColors.yellowColor : AppColors.mainColor,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/food${index + 1}.jpg"),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.height120,
              margin: EdgeInsets.only(
                left: Dimensions.width30,
                right: Dimensions.width30,
                bottom: Dimensions.height30,
              ),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(Dimensions.borderRadius20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0),
                    ),
                  ]),
              child: Container(
                padding: EdgeInsets.only(
                  top: Dimensions.height15,
                  left: Dimensions.width15,
                  right: Dimensions.width15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: "Chinese Slide",
                      color: AppColors.mainBlackColor,
                    ),
                    SizedBox(height: Dimensions.height10),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                              5,
                              (index) => Icon(
                                    Icons.star,
                                    color: AppColors.mainColor,
                                    size: Dimensions.height15,
                                  )),
                        ),
                        SizedBox(width: Dimensions.width10),
                        SmallText(text: "4.5"),
                        SizedBox(width: Dimensions.width10),
                        SmallText(text: "1287"),
                        SizedBox(width: Dimensions.width10),
                        SmallText(text: "Comments")
                      ],
                    ),
                    SizedBox(height: Dimensions.height20),
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
                          text: "1.7km",
                          iconColor: AppColors.mainColor,
                        ),
                        IconAndTextWidget(
                          icon: Icons.access_time_rounded,
                          text: "32min",
                          iconColor: AppColors.iconColor2,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
