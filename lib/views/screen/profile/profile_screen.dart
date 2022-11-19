import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
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

  // final ProfileController profilerController =
  //     Get.put(ProfileController(imageRepo: Get.find()));

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
                          // Container(
                          //   decoration: BoxDecoration(
                          //     boxShadow: <BoxShadow>[
                          //       BoxShadow(
                          //         color: Colors.grey.withOpacity(0.3),
                          //         blurRadius: 40,
                          //       ),
                          //     ],
                          //   ),
                          //   child: SizedBox(
                          //     height: 115,
                          //     width: 115,
                          //     child: Stack(
                          //       fit: StackFit.expand,
                          //       children: [
                          //         Obx(() {
                          //           if (profilerController.isLoading.value) {
                          //             return CircleAvatar(
                          //               backgroundImage:
                          //                   AssetImage('assets/img/icon.png'),
                          //               child: Center(
                          //                   child: CircularProgressIndicator(
                          //                 backgroundColor: Colors.white,
                          //               )),
                          //             );
                          //           } else {
                          //             if (profilerController.imageURL.length !=
                          //                 0) {
                          //               return CachedNetworkImage(
                          //                 imageUrl: profilerController.imageURL,
                          //                 fit: BoxFit.cover,
                          //                 imageBuilder:
                          //                     (context, imageProvider) =>
                          //                         CircleAvatar(
                          //                   backgroundColor: Colors.white,
                          //                   backgroundImage: imageProvider,
                          //                 ),
                          //                 placeholder: (context, url) =>
                          //                     CircleAvatar(
                          //                   backgroundImage: AssetImage(
                          //                       'assets/img/icon.png'),
                          //                   child: Center(
                          //                       child:
                          //                           CircularProgressIndicator(
                          //                     backgroundColor: Colors.white,
                          //                   )),
                          //                 ),
                          //                 errorWidget: (context, url, error) =>
                          //                     Icon(Icons.error),
                          //               );
                          //             } else {
                          //               return CircleAvatar(
                          //                 backgroundImage:
                          //                     AssetImage('assets/img/icon.png'),
                          //               );
                          //             }
                          //           }
                          //         }),
                          //         Positioned(
                          //           right: -16,
                          //           bottom: 0,
                          //           child: SizedBox(
                          //             height: 46,
                          //             width: 46,
                          //             child: FloatingActionButton(
                          //               shape: RoundedRectangleBorder(
                          //                 borderRadius:
                          //                     BorderRadius.circular(50),
                          //                 side: BorderSide(color: Colors.white),
                          //               ),
                          //               backgroundColor: Colors.grey[200],
                          //               onPressed: () {
                          //                 Get.bottomSheet(
                          //                   Container(
                          //                     decoration: BoxDecoration(
                          //                       color: Colors.white,
                          //                       borderRadius: const BorderRadius
                          //                               .only(
                          //                           topLeft:
                          //                               Radius.circular(16.0),
                          //                           topRight:
                          //                               Radius.circular(16.0)),
                          //                     ),
                          //                     child: Wrap(
                          //                       alignment: WrapAlignment.end,
                          //                       crossAxisAlignment:
                          //                           WrapCrossAlignment.end,
                          //                       children: [
                          //                         ListTile(
                          //                           leading: Icon(Icons.camera),
                          //                           title: Text('Camera'),
                          //                           onTap: () {
                          //                             Get.back();
                          //                             profilerController
                          //                                 .uploadImage(
                          //                                     ImageSource
                          //                                         .camera);
                          //                           },
                          //                         ),
                          //                         ListTile(
                          //                           leading: Icon(Icons.image),
                          //                           title: Text('Gallery'),
                          //                           onTap: () {
                          //                             Get.back();
                          //                             profilerController
                          //                                 .uploadImage(
                          //                                     ImageSource
                          //                                         .gallery);
                          //                           },
                          //                         ),
                          //                       ],
                          //                     ),
                          //                   ),
                          //                 );
                          //               },
                          //             ),
                          //           ),
                          //         )
                          //       ],
                          //     ),
                          //   ),
                          // GetBuilder<ImageController>(
                          //   init: ImageController(imageRepo: Get.find()),
                          //   builder: ((controller) {
                          //     return !controller.isLoading
                          //         ?

                          GestureDetector(
                            onTap: () {
                              // uploadImage(controller);
                            },
                            child: Container(
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
