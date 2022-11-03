import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  //Finding factors for responsive component size
  // Height/componentHeight = factor
  //844/320=2.64
  static double pageView = screenHeight / 2.64;
  static double pageViewContainer = screenHeight / 3.84;
  static double pageViewTextContainer = screenHeight / 7.83;

  static double iconSize24 = screenHeight / 35.17;

  static double dotSize9 = screenHeight / 93.78;
  static double dotSize18 = screenHeight / 46.89;

  static double borderRadius5 = screenHeight / 168.8;
  static double borderRadius15 = screenHeight / 84.4;
  static double borderRadius20 = screenHeight / 42.2;
  static double borderRadius30 = screenHeight / 28.13;

  //Dynamic Width
  static double width2 = screenHeight / 422;
  static double width3 = screenHeight / 281.33;
  static double width5 = screenHeight / 168.8;
  static double width10 = screenHeight / 84.4;
  static double width15 = screenHeight / 84.4;
  static double width20 = screenHeight / 42.2;
  static double width30 = screenHeight / 28.13;
  static double width45 = screenHeight / 18.76;
  static double width100 = screenHeight / 8.44;
  static double width120 = screenHeight / 7.03;
  //Dynamic Height
  static double height2 = screenHeight / 422;
  static double height3 = screenHeight / 281.33;
  static double height5 = screenHeight / 168.8;
  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 84.4;
  static double height20 = screenHeight / 42.2;
  static double height30 = screenHeight / 28.13;
  static double height45 = screenHeight / 18.76;
  static double height100 = screenHeight / 8.44;
  static double height120 = screenHeight / 7.03;
  static double height900 = screenHeight / 0.94;

  //List View Size
  static double listViewImgSize = screenWidth / 3.25;
  static double listViewTextConSize = screenWidth / 3.9;

  //Font sizes
  static double fontSize12 = screenHeight / 70.33;
  static double fontSize20 = screenHeight / 42.2;
}
