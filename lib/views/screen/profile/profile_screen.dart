import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resala/base/constant.dart';
import 'package:resala/controller/controllers/auth_controller.dart';
import 'package:resala/controller/controllers/user_controller.dart';
import 'package:resala/model/routes/router.dart';
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
                          Container(
                            height: Get.context!.width * 0.5,
                            width: Get.context!.width * 0.5,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(
                                  Get.context!.width * 0.5),
                              image: DecorationImage(
                                image: userController
                                            .userModel.data![0].image ==
                                        null
                                    ? const NetworkImage(AppConstant.ICONURL)
                                    : NetworkImage(userController
                                        .userModel.data![0].image!),
                                fit: BoxFit.cover,
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
                                onTap: () {
                                  Get.find<AuthController>().clearSharedData();
                                  Get.offNamed(RouteHelper.getAuth());
                                },
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
