import '../headers.dart';

class MyDialog {
  MyDialog._();
  //? Info Dialog
  static void getInfo(String msg) {
    Get.snackbar(
      'Info',
      msg,
      colorText: CustomColors.primaryColor,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  //? Error Dialog
  static void getWarning(String msg) {
    Get.snackbar(
      'Error',
      msg,
      backgroundColor: CustomColors.redAccent.withOpacity(.7),
      colorText: CustomColors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  //? Success Dialog
  static void getSuccess(String msg) {
    Get.snackbar(
      'Success',
      msg,
      backgroundColor: CustomColors.green.withOpacity(.4),
      colorText: CustomColors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  //? Loading Dialog
  static void showLoading() {
    Get.dialog(
      barrierDismissible: false,
      const Center(
        child: CircularProgressIndicator.adaptive(strokeCap: StrokeCap.round),
      ),
    );
  }

  static void hideLoading() => Get.back();
}
