import 'dart:developer';

import '../values/strings.dart';
import 'my_dialogs.dart';

class ExceptionHandler {
  ExceptionHandler._();
  static String _getErrorMessage(dynamic error) {
    if (error is String) {
      return error;
    } else if (error is Exception) {
      return error.toString();
    } else {
      return Strings.somethingWentWrong;
    }
  }

  static void handleException(dynamic error) {
    final errorMessage = _getErrorMessage(error);
    log(errorMessage);
    log('Caught: ${error.toString()}');
    MyDialog.getWarning(Strings.somethingWentWrong);
  }
}
