import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_color.dart';



class Notifier {
  static snackbar(String title, String message, [bool isError = true]) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.blue,
      animationDuration: const Duration(milliseconds: 6000),
      barBlur: 0.0,
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 0.0,
      colorText: Colors.white,
      margin: EdgeInsets.zero,
      icon: Icon(
        isError ? Icons.error : Icons.done,
        color: primaryColor,
      ),
    );
  }
}