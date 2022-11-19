import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resala/views/widget/colors.dart';

class TopWidget extends StatelessWidget {
  final String userName, activityCount, activityTypeName;
  final ImageProvider image;
  const TopWidget({
    Key? key,
    required this.image,
    required this.userName,
    required this.activityCount,
    required this.activityTypeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
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
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: Get.context!.width * 0.1,
            width: Get.context!.width * 0.1,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(Get.context!.width * 0.1),
              image: DecorationImage(
                image: image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Flexible(
            child: Container(
              margin: const EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          userName,
                          style: const TextStyle(
                            color: AppColors.hintTextColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Text(
                        activityTypeName,
                        style: const TextStyle(
                          color: AppColors.hintTextColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      "عدد المشاركات ${activityCount}",
                      style: const TextStyle(
                        color: AppColors.blackColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
