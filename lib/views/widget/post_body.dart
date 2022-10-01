import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resala/views/widget/colors.dart';

class BodyPost extends StatelessWidget {
  final String userName, details, date, activityInName, activityTypeName;
  const BodyPost({
    Key? key,
    required this.userName,
    required this.details,
    required this.date,
    required this.activityInName,
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
          CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            child: const Image(
              image: AssetImage('assets/img/icon.png'),
              fit: BoxFit.cover,
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
                        date,
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
                      details,
                      style: const TextStyle(
                        color: AppColors.blackColor,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            const Icon(Icons.edit_location_alt,
                                color: AppColors.mainBlueColor),
                            Container(
                              margin: const EdgeInsets.only(left: 3.0),
                              child: Text(
                                activityInName,
                                style: const TextStyle(
                                  color: AppColors.hintTextColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            const Icon(Icons.workspace_premium_outlined,
                                color: AppColors.mainRedColor),
                            Container(
                              margin: const EdgeInsets.only(left: 3.0),
                              child: Text(
                                activityTypeName,
                                style: const TextStyle(
                                  color: AppColors.hintTextColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
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
