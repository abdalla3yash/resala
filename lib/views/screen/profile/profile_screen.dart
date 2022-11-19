import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resala/base/constant.dart';
import 'package:resala/controller/controllers/auth_controller.dart';
import 'package:resala/controller/controllers/image_controller.dart';
import 'package:resala/controller/controllers/user_controller.dart';
import 'package:resala/model/routes/router.dart';
import 'package:resala/views/widget/colors.dart';
import 'package:resala/views/widget/custom_loader.dart';
import 'package:resala/views/widget/custom_snackbar.dart';
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

  // File? imageFile;
  // bool _load = true;

  // _getFromGallery() async {
  //   _load = false;
  //   PickedFile? pickedFile = await ImagePicker().getImage(
  //     source: ImageSource.gallery,
  //     maxWidth: 1800,
  //     maxHeight: 1800,
  //   );
  //   if (pickedFile != null) {
  //     File imageFile = File(pickedFile.path);
  //     _load = false;
  //   }
  // }

  // void updateProfile(UserController userController) {
  //   List<int> imageBytes = imageFile!.readAsBytesSync();
  //   String baseimage = base64Encode(imageBytes);
  //   userController
  //       .updateProfile(
  //           image: baseimage,
  //           mobile: "01091032414",
  //           password: "123456789",
  //           username: "ayash")
  //       .then((status) {
  //     if (status.isSuccess) {
  //       Navigator.pop(context);
  //       showCustomSnackBar("تم رفع الصورة الشخصيه بنجاح",
  //           title: " جمعيه رساله للاعمال الخيريه",
  //           color: AppColors.mainBlueColor);
  //     }
  //   });
  // }

  // void imageUpdate(ImageController imageController) {

  //       imageController
  //           .updateImage(image:
  //       )
  //           .then((status) {
  //         if (status.isSuccess) {
  //           Get.offNamed(RouteHelper.getinitial());
  //         } else if (!status.isSuccess) {
  //           showCustomSnackBar(status.message);
  //         }
  //       });
  //     }
  //   }

  File? image;

  void uploadImage(ImageController imageController) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      this.image = imageTemp;
      imageController.updateImage(image: imageTemp);

      print("uploaded successfulllllllllllllllly");
      print("Images path is  $imageTemp");
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: GetBuilder<UserController>(
        init: UserController(userRepo: Get.find()),
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
                          GetBuilder<ImageController>(
                            init: ImageController(imageRepo: Get.find()),
                            builder: ((controller) {
                              return !controller.isLoading
                                  ? GestureDetector(
                                      onTap: () {
                                        uploadImage(controller);
                                      },
                                      child: Container(
                                        height: Get.context!.width * 0.5,
                                        width: Get.context!.width * 0.5,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius: BorderRadius.circular(
                                              Get.context!.width * 0.5),
                                          image: DecorationImage(
                                            image: userController.userModel
                                                        .data![0].image ==
                                                    null
                                                ? const NetworkImage(
                                                    AppConstant.ICONURL)
                                                : NetworkImage(userController
                                                    .userModel.data![0].image!),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    )
                                  : spinkit;
                            }),
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
              : SizedBox(
                  width: Get.context!.width,
                  height: Get.context!.height * .7,
                  child: Center(
                    child: spinkit,
                  ));
        }),
      ),
    );
  }
}
