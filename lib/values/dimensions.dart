import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Dimensions {
  Dimensions._();
  static double height(double height) => Get.height * height;
  static double width(double width) => Get.width * width;

  static double getResponsiveHeight(double height) => height.h;
  static double getResponsiveWidth(double width) => width.w;
}
