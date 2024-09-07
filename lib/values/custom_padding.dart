import '../headers.dart';

class CustomPadding {
  CustomPadding._();
  static EdgeInsets get smallPadding =>
      EdgeInsets.symmetric(horizontal: Get.width * .02);

  //! Horizontal Padding
  static EdgeInsets get smallHorizontalPadding =>
      EdgeInsets.symmetric(horizontal: Get.width * .04);
  static EdgeInsets get mediumHorizontalPadding =>
      EdgeInsets.symmetric(horizontal: Get.width * .8);
  static EdgeInsets get largeHorizontalPadding =>
      EdgeInsets.symmetric(horizontal: Get.width * .12);

  //! Vertical Padding
  static EdgeInsets get smallVerticalPadding =>
      EdgeInsets.symmetric(vertical: Get.height * .04);
  static EdgeInsets get mediumVerticalPadding =>
      EdgeInsets.symmetric(vertical: Get.height * .8);
  static EdgeInsets get largeVerticalPadding =>
      EdgeInsets.symmetric(vertical: Get.height * .12);

  //! All Padding
  static EdgeInsets get smallAllPadding => const EdgeInsets.all(5);

  //! Horizontal Screen Util Padding
  static EdgeInsets get horizontalPadding6 =>
      const EdgeInsets.symmetric(horizontal: 6);
  static EdgeInsets get horizontalPadding8 =>
      const EdgeInsets.symmetric(horizontal: 8);
  static EdgeInsets get horizontalPadding10 =>
      const EdgeInsets.symmetric(horizontal: 10);
  static EdgeInsets get horizontalPadding16 =>
      const EdgeInsets.symmetric(horizontal: 16);
  static EdgeInsets get horizontalPadding20 =>
      const EdgeInsets.symmetric(horizontal: 20);
  static EdgeInsets get horizontalPadding24 =>
      const EdgeInsets.symmetric(horizontal: 24);

  //! Vertical Screen Util Padding
  static EdgeInsets get verticalPadding4 =>
      const EdgeInsets.symmetric(vertical: 4);
  static EdgeInsets get verticalPadding8 =>
      const EdgeInsets.symmetric(vertical: 8);
  static EdgeInsets get verticalPadding10 =>
      const EdgeInsets.symmetric(vertical: 10);
  static EdgeInsets get verticalPadding12 =>
      const EdgeInsets.symmetric(vertical: 12);
  static EdgeInsets get verticalPadding14 =>
      const EdgeInsets.symmetric(vertical: 14);
  static EdgeInsets get verticalPadding16 =>
      const EdgeInsets.symmetric(vertical: 16);

  //! All Screen Util Padding
  static EdgeInsets get allPadding4 => const EdgeInsets.all(4);
  static EdgeInsets get allPadding8 => const EdgeInsets.all(8);
  static EdgeInsets get allPadding10 => const EdgeInsets.all(10);
  static EdgeInsets get allPadding12 => const EdgeInsets.all(12);
  static EdgeInsets get allPadding14 => const EdgeInsets.all(14);
  static EdgeInsets get allPadding16 => const EdgeInsets.all(16);

  static EdgeInsets padding({double? horizontal, double? vertical}) =>
      EdgeInsets.symmetric(
          horizontal: horizontal ?? 0, vertical: vertical ?? 0);
  static EdgeInsets paddingOnly(
          {double? left, double? right, double? top, double? bottom}) =>
      EdgeInsets.only(
          left: left ?? 0,
          right: right ?? 0,
          top: top ?? 0,
          bottom: bottom ?? 0);
}
