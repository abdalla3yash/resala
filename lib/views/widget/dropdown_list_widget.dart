// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resala/views/widget/colors.dart';

class CustomDropDown extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var items, selectedValue, function;

  CustomDropDown(
      {super.key,
      required this.selectedValue,
      required this.function,
      required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Get.context!.width * 0.05,
      ),
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
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.whiteColor, width: 1),
            borderRadius: BorderRadius.circular(30),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.whiteColor, width: 1),
            borderRadius: BorderRadius.circular(30),
          ),
          filled: true,
          fillColor: AppColors.whiteColor,
        ),
        validator: (value) => value == null ? "Select a country" : null,
        dropdownColor: AppColors.whiteColor,
        value: selectedValue,
        hint: const Text("نوع المسئوليه"),
        onChanged: (value) => function,
        items: items,
      ),
    );
  }
}
