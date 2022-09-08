import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:resala/controller/controllers/auth_controller.dart';
import 'package:resala/views/widget/app_text_field.dart';
import 'package:resala/views/widget/colors.dart';
import 'package:resala/views/widget/custom_loader.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<DateTime?> dateSub = ValueNotifier(null);

    var emailController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var usernameController = TextEditingController();
    var nationalIDController = TextEditingController();
    var dateController = TextEditingController();
    var userTybeIDController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: GetBuilder<AuthController>(
        builder: ((controller) {
          return !controller.isLoading
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: Get.context!.height * 0.05,
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
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Get.context!.width * 0.05),
                        child: ValueListenableBuilder<DateTime?>(
                            valueListenable: dateSub,
                            builder: (context, dateVal, child) {
                              return InkWell(
                                onTap: () async {
                                  var date = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1950),
                                    lastDate: DateTime(2050),
                                    currentDate: DateTime.now(),
                                    initialEntryMode:
                                        DatePickerEntryMode.calendar,
                                    initialDatePickerMode: DatePickerMode.day,
                                    builder: (context, child) {
                                      return Theme(
                                        data: Theme.of(context).copyWith(
                                          colorScheme: ColorScheme.fromSwatch(
                                            primarySwatch: Colors.red,
                                            accentColor:
                                                AppColors.mainBlueColor,
                                            backgroundColor: Colors.lightBlue,
                                            cardColor: Colors.white,
                                          ),
                                        ),
                                        child: child!,
                                      );
                                    },
                                  );
                                  dateSub.value = date;
                                },
                                child: Container(
                                  child: buildDateTimePicker(
                                    dateVal != null ? convertDate(dateVal) : '',
                                  ),
                                ),
                              );
                            }),
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
                      SizedBox(
                        height: Get.context!.height * 0.04,
                      ),
                      GestureDetector(
                        onTap: () {},
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
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "نرحب بتواصلكم معنا",
                          style: TextStyle(
                              fontSize: 14, color: Colors.grey.shade600),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "19450",
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey.shade600),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(
                            Icons.phone,
                            size: 14,
                            color: AppColors.mainBlueColor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const VerticalDivider(),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "contact_us@resala.org",
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey.shade600),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(
                            Icons.mail,
                            size: 14,
                            color: AppColors.mainRedColor,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              : const CustomLoader();
        }),
      ),
    );
  }

  Widget buildDateTimePicker(String data) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
        side: BorderSide(color: AppColors.mainRedColor, width: 1.5),
      ),
      title: Text(data == "" ? "تاريخ الميلاد" : data),
      leading: const Icon(
        Icons.calendar_today,
        color: AppColors.mainRedColor,
      ),
    );
  }

  String convertDate(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }
}
