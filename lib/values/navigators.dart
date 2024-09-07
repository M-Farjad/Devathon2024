import 'package:get/get.dart';

class Navigators {
  Navigators._();

  static toNamed(String routeName) => Get.toNamed(routeName);
  static to(String routeName) => Get.toNamed(routeName);
  static toNamedReplace(String routeName) => Get.offNamed(routeName);
  static toReplace(String routeName) => Get.offNamed(routeName);
  static toNamedAll(String routeName) => Get.offAllNamed(routeName);
  static toAll(String routeName) => Get.offAllNamed(routeName);
  static toNamedUntilReplace(String routeName, {String? until}) =>
      Get.offNamedUntil(routeName, (route) => route.settings.name == until);
  static toUntilReplace(String routeName, {String? until}) =>
      Get.offNamedUntil(routeName, (route) => route.settings.name == until);

  void off(String routeName) => Get.offNamed(routeName);
  void offAll(String routeName) => Get.offAllNamed(routeName);
  void offUntil(String routeName, {String? until}) =>
      Get.offNamedUntil(routeName, (route) => route.settings.name == until);
  void offNamed(String routeName) => Get.offNamed(routeName);
  void offAllNamed(String routeName) => Get.offAllNamed(routeName);
  void offNamedUntil(String routeName, {String? until}) =>
      Get.offNamedUntil(routeName, (route) => route.settings.name == until);

  void back() => Get.back();
}
