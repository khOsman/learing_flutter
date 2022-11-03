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

  static double dotSize9 = screenHeight / 93.78;
  static double dotSize18 = screenHeight / 46.89;

  static double borderRadius5 = screenHeight / 168.8;
  static double borderRadius20 = screenHeight / 42.2;
  static double borderRadius30 = screenHeight / 28.13;

  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 84.4;
  static double height20 = screenHeight / 42.2;
  static double height30 = screenHeight / 28.13;
  static double height120 = screenHeight / 7.03;

  static double fontSize12 = screenHeight / 70.33;
  static double fontSize20 = screenHeight / 42.2;
}
