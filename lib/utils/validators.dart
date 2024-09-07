import 'package:flutter/material.dart';

import '../values/strings.dart';

class Validators {
  Validators._();
  static String? Function(String?)? validateEmail() {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return Strings.enterEmail;
      }
      if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(value)) {
        return Strings.enterValidEmail;
      }
      return null;
    };
  }

  static String? Function(String?)? validatePassword() {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return Strings.enterPassword;
      }

      if (value.length < 8) {
        return Strings.minCharLength;
      }

      if (!RegExp(r'[0-9]').hasMatch(value)) {
        return Strings.min1Digit;
      }

      if (!RegExp(r'[!@#$%^&*(),.?_":{}|<>]').hasMatch(value)) {
        return Strings.min1SpecialChar;
      }

      if (!RegExp(r'[A-Z]').hasMatch(value)) {
        return Strings.min1UpperCase;
      }

      if (!RegExp(r'[a-z]').hasMatch(value)) {
        return Strings.min1LowerCase;
      }

      return null;
    };
  }

  static String? Function(String?)? validateConfirmCode() {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return Strings.enterConfirmCode;
      }
      // Check if the entered code is a six-digit number
      if (!RegExp(r'^[0-9]{6}$').hasMatch(value)) {
        return Strings.enterValidConfirmCode;
      }

      return null;
    };
  }

  static String? Function(String?)? validateConfirmPassword(
      TextEditingController controller) {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return Strings.enterConfirmPassword;
      }
      if (value != controller.text) {
        return Strings.passwordsNotMatch;
      }
      return null;
    };
  }

  static String? Function(String?)? validateNewPassword(
      TextEditingController oldPassword) {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return Strings.enterPassword;
      }

      if (value.length < 8) {
        return Strings.minCharLength;
      }

      if (!RegExp(r'[0-9]').hasMatch(value)) {
        return Strings.min1Digit;
      }

      if (!RegExp(r'[!@#$%^&*(),.?_":{}|<>]').hasMatch(value)) {
        return Strings.min1SpecialChar;
      }

      if (!RegExp(r'[A-Z]').hasMatch(value)) {
        return Strings.min1UpperCase;
      }

      if (!RegExp(r'[a-z]').hasMatch(value)) {
        return Strings.min1LowerCase;
      }
      // log('oldPassword: ${oldPassword.text}');
      // log('value: $value');
      if (value == oldPassword.text) {
        return Strings.newPasswordCannotBeOldPassword;
      }
      return null;
    };
  }
}
