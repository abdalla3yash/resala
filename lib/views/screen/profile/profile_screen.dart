import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resala/views/widget/colors.dart';
import 'package:resala/views/widget/show_field.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Container(
          width: double.maxFinite,
          margin: EdgeInsets.only(top: Get.context!.height * 0.1),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.mainRedColor,
                radius: Get.context!.width * 0.25,
                child: Center(
                  child: Icon(
                    Icons.person,
                    size: Get.context!.width * 0.2,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
              SizedBox(
                height: Get.context!.height * 0.05,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: AccountWidget(
                            icon: Icons.person, text: "عبدالله عياش"),
                      ),
                      SizedBox(
                        height: Get.context!.height * 0.02,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: AccountWidget(
                            icon: Icons.email, text: "ayash@mail.com"),
                      ),
                      SizedBox(
                        height: Get.context!.height * 0.02,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: AccountWidget(
                            icon: Icons.phone, text: "01091032414"),
                      ),
                      SizedBox(
                        height: Get.context!.height * 0.02,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: AccountWidget(
                          icon: Icons.logout,
                          text: "تسجيل الخروج",
                          color: AppColors.mainRedColor,
                          iconColor: AppColors.whiteColor,
                          textColor: AppColors.whiteColor,
                        ),
                      ),
                      SizedBox(
                        height: Get.context!.height * 0.02,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
