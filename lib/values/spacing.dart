import '../headers.dart';

class Spacing {
  Spacing._();
  static verticalSpace(double height) {
    return SizedBox(height: Get.height * height);
  }

  static horizontalSpace(double width) {
    return SizedBox(width: Get.width * width);
  }

  static Widget vertical(double height) {
    return SizedBox(height: height);
  }

  static Widget horizontal(double width) {
    return SizedBox(width: width);
  }
}
