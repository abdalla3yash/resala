// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resala/views/widget/colors.dart';

class AccountWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color, iconColor, textColor;

  AccountWidget(
      {super.key,
      required this.icon,
      required this.text,
      this.color = Colors.white,
      this.iconColor = AppColors.mainBlueColor,
      this.textColor = AppColors.blackColor});

  @override
  Widget build(BuildContext context) {
    // update
    return Container(
      width: double.maxFinite,
      height: Get.context!.height * 0.1,
      margin: EdgeInsets.symmetric(horizontal: Get.context!.width * 0.05),
      decoration: BoxDecoration(
        color: color,
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
      child: Row(children: [
        SizedBox(
          width: Get.context!.width * 0.05,
        ),
        Icon(
          icon,
          color: iconColor,
          size: Get.context!.width * 0.08,
        ),
        Spacer(),
        Text(
          text,
          style: TextStyle(fontSize: 16, color: textColor),
        ),
        SizedBox(
          width: Get.context!.width * 0.05,
        ),
        Spacer(),
      ]),
    );
  }
}
