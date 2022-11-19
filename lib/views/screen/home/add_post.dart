import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resala/views/widget/app_text_field.dart';
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
  int? _selectedIndex1, _selectedIndex2;
  TextEditingController activityInIdController = TextEditingController();
  TextEditingController activityTypeController = TextEditingController();
  TextEditingController detailsController = TextEditingController();

  void addPost(HomeController homeController) {
    String userTypeId = activityInIdController.text.trim();
    String details = detailsController.text.trim();
    String activityType = activityTypeController.text.trim();
    homeController
        .addPost(
            activityDate: DateTime.now().toString(),
            activityInId: userTypeId,
            activityTypeId: activityType,
            details: details)
        .then((status) {
      if (details.isEmpty) {
        showCustomSnackBar("يرجي تسجيل المشاركه",
            title: " جمعيه رساله للاعمال الخيريه");
      } else if (status.isSuccess) {
        Navigator.pop(context);
        showCustomSnackBar("تم تسجيل مشاركتك بنجاح",
            title: " جمعيه رساله للاعمال الخيريه",
            color: AppColors.mainBlueColor);
      }
    });
  }

  void userTypePost(HomeController homeController) {
    String userTypeId = activityInIdController.text.trim();

    homeController.activityType(userTypeId).then(
      (status) {
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
                          height: controller.ActivityTypeList.length > 6
                              ? Get.context!.height * 0.35
                              : Get.context!.height * 0.25,
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
                                        selected: _selectedIndex1 == i,
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
                                        onSelected: (bool selected) {
                                          setState(
                                            () {
                                              if (selected) {
                                                _selectedIndex1 = i;
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
                                    onPressed: () {
                                      Navigator.pop(context);
                                      showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
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
                                                    ? Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          bottom: MediaQuery.of(
                                                            context,
                                                          ).viewInsets.bottom,
                                                        ),
                                                        child: SizedBox(
                                                            width: Get
                                                                .context!.width,
                                                            height: Get.context!
                                                                    .height *
                                                                0.25,
                                                            child: Stack(
                                                                children: [
                                                                  SizedBox(
                                                                    width: Get
                                                                        .context!
                                                                        .width,
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          AppTextField(
                                                                        textController:
                                                                            detailsController,
                                                                        hintText:
                                                                            "سجل مشاركتك",
                                                                        icon: Icons
                                                                            .app_registration_rounded,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Positioned(
                                                                    bottom: 10,
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: [
                                                                        TextButton(
                                                                          onPressed:
                                                                              () {
                                                                            addPost(controller);
                                                                          },
                                                                          child:
                                                                              const Text('تسجيل'),
                                                                        ),
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(context),
                                                                          child:
                                                                              const Text('الغاء'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ])),
                                                      )
                                                    : SizedBox(
                                                        width:
                                                            Get.context!.width,
                                                        height: Get.context!
                                                                .height *
                                                            .7,
                                                        child: Center(
                                                          child: spinkit,
                                                        ));
                                              }),
                                            );
                                          });
                                    },
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
                      : SizedBox(
                          width: Get.context!.width,
                          height: Get.context!.height * .7,
                          child: Center(
                            child: spinkit,
                          ));
                }),
              );
            },
          );
        }
      },
    );
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
                          ? StatefulBuilder(builder: (context, setState) {
                              return SizedBox(
                                width: Get.context!.width,
                                height: controller.activityInList.length < 4
                                    ? Get.context!.height * 0.2
                                    : Get.context!.height * 0.3,
                                child: Stack(children: [
                                  SizedBox(
                                    height: Get.context!.height * 0.05,
                                  ),
                                  SizedBox(
                                    width: Get.context!.width,
                                    child: Wrap(
                                      children: List<Widget>.generate(
                                        controller.activityInList.length,
                                        (int x) {
                                          return Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  Get.context!.width * 0.03,
                                              vertical:
                                                  Get.context!.height * 0.03,
                                            ),
                                            child: ChoiceChip(
                                              selected: _selectedIndex2 == x,
                                              label: Text(
                                                controller
                                                    .activityInList[x]!.name!,
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
                                              onSelected: (bool selected) {
                                                setState(
                                                  () {
                                                    if (selected) {
                                                      _selectedIndex2 = x;
                                                      activityInIdController
                                                              .text =
                                                          controller
                                                              .activityInList[x]
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
                                ]),
                              );
                            })
                          : SizedBox(
                              width: Get.context!.width,
                              height: Get.context!.height * .7,
                              child: Center(
                                child: spinkit,
                              ));
                    }),
                  );
                });
          },
        ),
      ),
    );
  }
}
