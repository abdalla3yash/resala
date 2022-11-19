import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:resala/controller/controllers/auth_controller.dart';
import 'package:resala/model/routes/router.dart';
import 'package:resala/views/widget/app_text_field.dart';
import 'package:resala/views/widget/colors.dart';
import 'package:resala/views/widget/custom_loader.dart';
import 'package:resala/views/widget/custom_snackbar.dart';
import 'package:resala/views/widget/footer.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with TickerProviderStateMixin {
  TextEditingController dateinputController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController nationalIDController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userTypeIDController = TextEditingController();
  int? _selectedIndex;

  @override
  void initState() {
    super.initState();
    Get.find<AuthController>().getUserTypeList();
    dateinputController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    void registeration(AuthController authController) {
      String name = nameController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      String phone = phoneController.text.trim();
      String username = usernameController.text.trim();
      String nationalID = nationalIDController.text.trim();
      String birthDay = dateinputController.text.trim();
      String userTypeId = userTypeIDController.text.trim();

      if (name.isEmpty) {
        showCustomSnackBar("من فضلك أدخل الاسم بالكامل", title: "الاسم");
      } else if (username.isEmpty) {
        showCustomSnackBar("من فضلك أدخل اسم المستخدم", title: "اسم المستخدم");
      } else if (email.isEmpty) {
        showCustomSnackBar("من فضلك أدخل البريد الالكتروني",
            title: "البريد الالكتروني");
      } else if (phone.isEmpty) {
        showCustomSnackBar("من فضلك أدخل رقم الهاتف ", title: "رقم الهاتف");
      } else if (nationalID.isEmpty) {
        showCustomSnackBar("من فضلك أدخل الرقم القومي", title: "الرقم القومي");
      } else if (birthDay.isEmpty) {
        showCustomSnackBar("من فضلك أدخل تاريخ الميلاد",
            title: "تاريخ الميلاد");
      } else if (password.isEmpty) {
        showCustomSnackBar("من فضلك يجب اختيار نوع المسئوليه",
            title: "نوع المسئوليه");
      } else if (userTypeId.isEmpty) {
        showCustomSnackBar("من فضلك أدخل رقم قومي صالح", title: "الرقم القومي");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar("من فضلك أدخل عنوان بريد الكتروني صالح",
            title: "البريد الالكتروني");
      } else if (password.length < 6) {
        showCustomSnackBar("كلمه السر يجب أن تكون اكثر من 6 حروف",
            title: "كلمه السر");
      } else if (nationalID.length != 14) {
        showCustomSnackBar("من فضلك أدخل رقم قومي صالح", title: "الرقم القومي");
      } else {
        showCustomSnackBar("تم انشاء الحساب بنجاح",
            title: "رساله", color: AppColors.mainBlueColor);

        authController
            .registeration(
          email: email,
          password: password,
          mobile: phone,
          name: name,
          user_name: username,
          birth_date: birthDay,
          national_id: nationalID,
          user_type_id: userTypeId,
        )
            .then((status) {
          if (status.isSuccess) {
            Get.offNamed(RouteHelper.getinitial());
          } else if (!status.isSuccess) {
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: GetBuilder<AuthController>(
        builder: ((controller) {
          return !controller.isLoading
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: Get.context!.height * 0.04,
                      ),
                      AppTextField(
                        textController: nameController,
                        hintText: "الاسم بالكامل",
                        icon: Icons.insert_emoticon_sharp,
                      ),
                      SizedBox(
                        height: Get.context!.height * 0.02,
                      ),
                      AppTextField(
                        textController: usernameController,
                        hintText: "اسم المستخدم",
                        icon: Icons.verified_user_rounded,
                      ),
                      SizedBox(
                        height: Get.context!.height * 0.02,
                      ),
                      AppTextField(
                        textController: emailController,
                        hintText: "البريد الالكتروني",
                        icon: Icons.person,
                      ),
                      SizedBox(
                        height: Get.context!.height * 0.02,
                      ),
                      AppTextField(
                        textController: phoneController,
                        hintText: "رقم الهاتف",
                        icon: Icons.phone,
                      ),
                      SizedBox(
                        height: Get.context!.height * 0.02,
                      ),
                      AppTextField(
                        textController: nationalIDController,
                        hintText: "الرقم القومي",
                        icon: Icons.inventory_rounded,
                      ),
                      SizedBox(
                        height: Get.context!.height * 0.02,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: Get.context!.width * 0.05),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                spreadRadius: 1,
                                offset: const Offset(1, 2),
                                color:
                                    AppColors.mainBlueColor.withOpacity(0.15),
                              ),
                            ]),
                        child: Center(
                          child: TextField(
                            controller: dateinputController,
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: "تاريخ الميلاد",
                              prefixIcon: const Icon(
                                Icons.calendar_month_outlined,
                                color: AppColors.mainRedColor,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    width: 1.0, color: Colors.white),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    width: 1.0, color: Colors.white),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  lastDate: DateTime.now(),
                                  builder: (context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                        colorScheme: ColorScheme.fromSwatch(
                                          primarySwatch: Colors.red,
                                          accentColor: AppColors.mainBlueColor,
                                          backgroundColor: Colors.lightBlue,
                                          cardColor: Colors.white,
                                        ),
                                      ),
                                      child: child!,
                                    );
                                  });

                              if (pickedDate != null) {
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                setState(
                                  () {
                                    dateinputController.text = formattedDate;
                                  },
                                );
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.context!.height * 0.02,
                      ),
                      AppTextField(
                        textController: passwordController,
                        hintText: "كلمه السر",
                        icon: Icons.lock,
                        obsecure: true,
                      ),
                      SizedBox(
                        height: Get.context!.height * 0.02,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding:
                              EdgeInsets.only(right: Get.context!.width * 0.07),
                          child: const Text(
                            "يرجي اختيار نوع المسئوليه",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: userType(),
                      ),
                      SizedBox(
                        height: Get.context!.height * 0.02,
                      ),
                      GestureDetector(
                        onTap: () {
                          registeration(controller);
                        },
                        child: Container(
                          width: Get.context!.width * 0.9,
                          height: Get.context!.height / 13,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: AppColors.mainBlueColor,
                          ),
                          child: const Center(
                            child: Text(
                              "انشاء حساب",
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.context!.height * 0.05,
                      ),
                      const Footer(),
                      SizedBox(
                        height: Get.context!.height * 0.01,
                      ),
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

  Widget userType() {
    return GetBuilder<AuthController>(
      builder: ((controller) {
        return !controller.isLoading
            ? SizedBox(
                width: Get.context!.width,
                child: Wrap(
                  runAlignment: WrapAlignment.center,
                  children: List<Widget>.generate(
                    controller.userTypeList.length,
                    (int i) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Get.context!.width * 0.04,
                        ),
                        child: ChoiceChip(
                          selected: _selectedIndex == i,
                          label: Text(
                            controller.userTypeList[i]!.name!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          elevation: 5,
                          pressElevation: 5,
                          shadowColor: AppColors.mainBlueColor,
                          backgroundColor:
                              AppColors.mainRedColor.withOpacity(0.5),
                          selectedColor: AppColors.mainRedColor,
                          onSelected: (bool selected) {
                            setState(
                              () {
                                if (selected) {
                                  _selectedIndex = i;
                                  userTypeIDController.text =
                                      controller.userTypeList[i].id.toString();
                                }
                              },
                            );
                          },
                        ),
                      );
                    },
                  ).toList(),
                ),
              )
            : spinkit;
      }),
    );
  }

  // Widget _buildChips() {
  //   List<Widget> chips = [];

  //   for (int i = 0; i < 3; i++) {
  //     GetBuilder<AuthController> choiceChip = GetBuilder<AuthController>(
  //       builder: ((controller) {
  //         return !controller.isLoading
  //             ? ChoiceChip(
  //                 selected: _selectedIndex == i,
  //                 label: Text(
  //                   controller.userTypeList[i]!.name!,
  //                   style: const TextStyle(color: Colors.white, fontSize: 14),
  //                 ),
  //                 elevation: 10,
  //                 pressElevation: 5,
  //                 shadowColor: AppColors.mainBlueColor,
  //                 backgroundColor: AppColors.mainRedColor.withOpacity(0.5),
  //                 selectedColor: AppColors.mainRedColor,
  //                 onSelected: (bool selected) {
  //                   setState(
  //                     () {
  //                       if (selected) {
  //                         _selectedIndex = i;
  //                         userTypeIDController.text =
  //                             controller.userTypeList[i].id.toString();
  //                       }
  //                     },
  //                   );
  //                 },
  //               )
  //             : SizedBox(
  //                 width: Get.context!.width,
  //                 height: Get.context!.height * .7,
  //                 child: Center(
  //                   child: spinkit,
  //                 ));
  //       }),
  //     );
  //     chips.add(
  //       Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 10),
  //         child: choiceChip,
  //       ),
  //     );
  //   }

  //   return ListView(
  //     scrollDirection: Axis.horizontal,
  //     children: chips,
  //   );
  // }
}
