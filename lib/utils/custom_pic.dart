import 'dart:developer';

class CustomPic {
  CustomPic._();
  static String getCustomPic(int dimension) {
    log('https://via.placeholder.com/${dimension}x$dimension');
    return 'https://via.placeholder.com/${dimension}x$dimension';
  }
}
