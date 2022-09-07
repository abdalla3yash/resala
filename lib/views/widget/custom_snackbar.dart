import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resala/views/widget/colors.dart';

void showCustomSnackBar(String message,
    {bool isError = true,
    Color color = Colors.redAccent,
    String title = "Error"}) {
  Get.snackbar(title, message,
      titleText: Text(
        title,
        style: const TextStyle(color: AppColors.whiteColor),
      ),
      messageText: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      backgroundColor: color);
}
