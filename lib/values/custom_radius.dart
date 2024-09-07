import '../headers.dart';

class CustomRadius {
  CustomRadius._();
  static BorderRadius get radius8 => BorderRadius.circular(8);
  static BorderRadius get radius10 => BorderRadius.circular(10);
  static BorderRadius get radius12 => BorderRadius.circular(12);
  static BorderRadius get radius16 => BorderRadius.circular(16);
  static BorderRadius get radius20 => BorderRadius.circular(20);
  static BorderRadius get radius24 => BorderRadius.circular(24);
  static BorderRadius radius(double radius) => BorderRadius.circular(radius);

  static RoundedRectangleBorder get roundedRectangle8 =>
      RoundedRectangleBorder(borderRadius: radius8);
  static RoundedRectangleBorder get roundedRectangle12 =>
      RoundedRectangleBorder(borderRadius: radius12);
  static RoundedRectangleBorder get roundedRectangle16 =>
      RoundedRectangleBorder(borderRadius: radius16);
  static RoundedRectangleBorder get roundedRectangle20 =>
      RoundedRectangleBorder(borderRadius: radius20);
  static RoundedRectangleBorder get roundedRectangle24 =>
      RoundedRectangleBorder(borderRadius: radius24);

  static RoundedRectangleBorder roundedRectangle(double radius) =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius));
}
