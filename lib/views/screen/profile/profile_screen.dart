import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resala/controller/controllers/user_controller.dart';
import 'package:resala/views/widget/colors.dart';
import 'package:resala/views/widget/custom_loader.dart';
import 'package:resala/views/widget/show_field.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<UserController>().getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: GetBuilder<UserController>(
        builder: ((userController) {
          return userController.isLoading
              ? Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.only(
                    top: Get.context!.height * 0.1,
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey.shade200,
                            radius: Get.context!.width * 0.25,
                            child: Center(
                              child: userController.userModel.data![0].image ==
                                      null
                                  ? Image.asset(
                                      "assets/img/icon.png",
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      userController.userModel.data![0].image!,
                                    ),
                            ),
                          ),
                          const Positioned(
                            bottom: 0,
                            right: 20,
                            child: CircleAvatar(
                              backgroundColor: AppColors.mainRedColor,
                              child: Icon(
                                Icons.edit,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ),
                        ],
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
                                  icon: Icons.person,
                                  text: userController.userModel.data![0].name!,
                                ),
                              ),
                              SizedBox(
                                height: Get.context!.height * 0.02,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: AccountWidget(
                                    icon: Icons.email,
                                    text: userController
                                        .userModel.data![0].email!),
                              ),
                              SizedBox(
                                height: Get.context!.height * 0.02,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: AccountWidget(
                                  icon: Icons.phone,
                                  text:
                                      userController.userModel.data![0].mobile!,
                                ),
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
                )
              : const CustomLoader();
        }),
      ),
    );
  }
}
