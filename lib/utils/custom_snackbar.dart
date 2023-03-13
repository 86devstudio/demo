import 'package:flutter/material.dart';
import 'package:get/get.dart';

customSnackbar({title, message, backgroundColor}) {
  Get.snackbar(title, message,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 1),
      backgroundColor: backgroundColor,
      colorText: Colors.white);
}
