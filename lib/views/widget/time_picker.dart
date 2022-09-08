import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resala/views/widget/colors.dart';

class CustomTimePicker extends StatelessWidget {
  final String data;
  const CustomTimePicker({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.context!.height * 0.1,
      margin: EdgeInsets.symmetric(horizontal: Get.context!.width * 0.05),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            spreadRadius: 1,
            offset: const Offset(1, 2),
            color: AppColors.mainBlueColor.withOpacity(0.15),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Get.context!.width * 0.03),
            child: const Icon(
              Icons.calendar_month_outlined,
              color: AppColors.mainRedColor,
            ),
          ),
          Text(
            data == "" ? "تاريخ الميلاد" : data,
            style: const TextStyle(color: AppColors.hintTextColor),
          ),
        ],
      ),
    );
  }
}
