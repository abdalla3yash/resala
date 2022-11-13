import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resala/base/constant.dart';
import 'package:resala/views/screen/home/activity_type.dart';
import 'package:resala/views/widget/colors.dart';
import 'package:resala/views/widget/custom_loader.dart';
import 'package:resala/views/widget/custom_snackbar.dart';

import '../../../controller/controllers/home_controller.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  int? _selectedIndex;
  TextEditingController userTypeIDController = TextEditingController();
  TextEditingController activityTypeController = TextEditingController();

  void userTypePost(HomeController homeController) {
    String userTypeId = userTypeIDController.text.trim();

    homeController.activityType(userTypeId).then((status) {
      if (status.isSuccess) {
        showModalBottomSheet(
            context: context,
            isDismissible: true,
            enableDrag: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            builder: (builder) {
              return GetBuilder<HomeController>(
                builder: ((controller) {
                  return controller.isLoaded
                      ? SizedBox(
                          width: Get.context!.width,
                          height: controller.ActivityTypeList.length > 4
                              ? Get.context!.height * 0.4
                              : Get.context!.height * 0.2,
                          child: Stack(children: [
                            SizedBox(
                              height: Get.context!.height * 0.05,
                            ),
                            SizedBox(
                              width: Get.context!.width * 0.9,
                              child: Wrap(
                                children: List<Widget>.generate(
                                  controller.ActivityTypeList.length,
                                  (int i) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: Get.context!.width * 0.01,
                                        vertical: Get.context!.height * 0.01,
                                      ),
                                      child: ChoiceChip(
                                        label: Text(
                                          controller.ActivityTypeList[i]!.name!,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                        elevation: 5,
                                        pressElevation: 5,
                                        shadowColor: AppColors.mainBlueColor,
                                        backgroundColor: AppColors.mainRedColor
                                            .withOpacity(0.5),
                                        selectedColor: AppColors.mainRedColor,
                                        selected: controller
                                                .ActivityTypeList[i]!.id ==
                                            i,
                                        onSelected: (bool selected) {
                                          setState(
                                            () {
                                              if (selected) {
                                                _selectedIndex = i;
                                                activityTypeController.text =
                                                    controller
                                                        .ActivityTypeList[i].id
                                                        .toString();
                                              }
                                            },
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                            SizedBox(height: Get.context!.height * 0.02),
                            Positioned(
                              bottom: 10,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text('التالى'),
                                  ),
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('الغاء'),
                                  ),
                                ],
                              ),
                            ),
                          ]))
                      : const Align(
                          alignment: Alignment.center, child: CustomLoader());
                }),
              );
            });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.mainRedColor,
      radius: 25,
      child: Center(
        child: IconButton(
          icon: const Icon(
            Icons.edit_note,
            color: Colors.white,
            size: 32,
          ),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                isDismissible: true,
                enableDrag: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                builder: (builder) {
                  return GetBuilder<HomeController>(
                    builder: ((controller) {
                      return controller.isLoaded
                          ? SizedBox(
                              width: Get.context!.width,
                              height: controller.activityInList.length < 4
                                  ? Get.context!.height * 0.2
                                  : Get.context!.height * 0.3,
                              child: Stack(children: [
                                SizedBox(
                                  height: Get.context!.height * 0.05,
                                ),
                                SizedBox(
                                  width: Get.context!.width * 0.9,
                                  child: Wrap(
                                    children: List<Widget>.generate(
                                      controller.activityInList.length,
                                      (int i) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal:
                                                Get.context!.width * 0.05,
                                            vertical:
                                                Get.context!.height * 0.03,
                                          ),
                                          child: ChoiceChip(
                                            label: Text(
                                              controller
                                                  .activityInList[i]!.name!,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                            elevation: 5,
                                            pressElevation: 5,
                                            shadowColor:
                                                AppColors.mainBlueColor,
                                            backgroundColor: AppColors
                                                .mainRedColor
                                                .withOpacity(0.5),
                                            selectedColor:
                                                AppColors.mainRedColor,
                                            selected: controller
                                                    .activityInList[i]!.id ==
                                                i,
                                            onSelected: (bool selected) {
                                              setState(
                                                () {
                                                  if (selected) {
                                                    _selectedIndex = i;
                                                    userTypeIDController.text =
                                                        controller
                                                            .activityInList[i]
                                                            .id
                                                            .toString();
                                                  }
                                                },
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ).toList(),
                                  ),
                                ),
                                SizedBox(height: Get.context!.height * 0.02),
                                Positioned(
                                  bottom: 10,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          userTypePost(controller);
                                        },
                                        child: const Text('التالي'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('الغاء'),
                                      ),
                                    ],
                                  ),
                                ),
                              ]))
                          : Align(
                              alignment: Alignment.center,
                              child: const CustomLoader());
                    }),
                  );
                });
          },
        ),
      ),
    );
  }
}
