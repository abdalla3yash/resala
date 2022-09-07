import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resala/views/widget/colors.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: Get.context!.height * 0.1,
        height: Get.context!.height * 0.1,
        decoration: BoxDecoration(
          color: AppColors.mainBlueColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Center(
          child: CircularProgressIndicator(
            color: AppColors.mainRedColor,
            strokeWidth: 2.0,
          ),
        ),
      ),
    );
  }
}
