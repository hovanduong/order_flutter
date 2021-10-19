import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supercharged/supercharged.dart';

class AppValid {
  AppValid._();

  static validateBudgetMin(TextEditingController controller) {
    return (value) {
      final max = controller.text.toDouble();
      if (value == null || value.length == 0) {
        return 'valid_full_name'.tr;
      }
      if(value.toString().toDouble() < 0)
        return 'valid_budget_min_zero'.tr;
      if(value.toString().toDouble() >= (max ?? double.maxFinite))
        return 'valid_budget_min_max'.tr;
      return null;
    };
  }

  static validateBudgetMax(TextEditingController controller) {
    return (value) {
      final min = controller.text.toDouble();
      if (value == null || value.length == 0) {
        return 'valid_full_name'.tr;
      }
      if(value.toString().toDouble() < 0)
        return 'valid_budget_max_zero'.tr;
      if(value.toString().toDouble() <= (min ?? 0))
        return 'valid_budget_max_min'.tr;
      return null;
    };
  }

  static validatePhone() {
    return (value) {
      if (value == null || value.length == 0) return 'valid_enter_phone'.tr;
      Pattern pattern = r'^(?:[+0]9)?[0-9]{10}$';
      RegExp regex = new RegExp(pattern);
      if (!regex.hasMatch(value)) return 'valid_phone'.tr;
    };
  }

  static validateFullName() {
    return (value) {
      if (value == null || value.length == 0) {
        return 'valid_full_name'.tr;
      }
      return null;
    };
  }

  static validateEmail() {
    return (value) {
      if (value == null || value.length == 0) {
        return 'valid_enter_email'.tr;
      } else {
        Pattern pattern =
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regex = new RegExp(pattern);
        if (!regex.hasMatch(value))
          return 'valid_email'.tr;
        else
          return null;
      }
    };
  }

  static validatePassword() {
    return (value) {
      if (value == null || value.length < 6) {
        return 'valid_password'.tr;
      } else {
        Pattern pattern = r'^[0-9a-zA-Z!@#\$&*~]{6,}$';
        RegExp regex = new RegExp(pattern);
        if (!regex.hasMatch(value))
          return 'valid_password'.tr;
        else
          return null;
      }
    };
  }
  static validatePasswordConfirm(TextEditingController controller) {
    return (value) {
      if (controller.text != value)
        return 'valid_password_confirm'.tr;
      else
        return null;
    };
  }

  static validatePhoneNumber() {
    Pattern pattern = r'^(?:[+0]9)?[0-9]{10}$';
    RegExp regex = new RegExp(pattern);

    return (value) {
      if (value == null || value.length == 0) {
        return 'valid_enter_phone'.tr;
      } else if (value.length != 10) {
        return 'valid_phone'.tr;
      } else if (!regex.hasMatch(value)) {
        return 'valid_phone'.tr;
      } else {
        return null;
      }
    };
  }
}
