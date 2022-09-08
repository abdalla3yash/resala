import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:resala/controller/controllers/auth_controller.dart';
import 'package:resala/views/widget/app_text_field.dart';
import 'package:resala/views/widget/colors.dart';
import 'package:resala/views/widget/custom_loader.dart';
import 'package:resala/views/widget/footer.dart';
import 'package:resala/views/widget/time_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<DateTime?> dateSub = ValueNotifier(null);

    var emailController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var usernameController = TextEditingController();
    var nationalIDController = TextEditingController();
    var userTybeIDController = TextEditingController();
    var passwordController = TextEditingController();

    int? selectedIndex;
    List<String> chipsList = [
      "مسئول",
      "متطوع",
      "مركزي / مدير",
    ];
    List<Widget> techChips() {
      List<Widget> chips = [];
      for (int i = 0; i < chipsList.length; i++) {
        Widget item = Padding(
          padding: const EdgeInsets.only(left: 10, right: 5),
          child: ChoiceChip(
            label: Text(chipsList[i].toString()),
            labelStyle: const TextStyle(color: Colors.white),
            backgroundColor: AppColors.mainRedColor,
            selectedColor: AppColors.mainBlueColor,
            disabledColor: AppColors.whiteColor,
            selected: selectedIndex == i,
            onSelected: (bool value) {
              setState(() {
                selectedIndex = i;
              });
            },
          ),
        );
        chips.add(item);
      }
      return chips;
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
                      ValueListenableBuilder<DateTime?>(
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
                                          accentColor: AppColors.mainBlueColor,
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
                              child: CustomTimePicker(
                                data:
                                    dateVal != null ? convertDate(dateVal) : '',
                              ),
                            );
                          }),
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
                      Wrap(
                        spacing: 3,
                        direction: Axis.horizontal,
                        children: techChips(),
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
                      const Footer(),
                      SizedBox(
                        height: Get.context!.height * 0.01,
                      ),
                    ],
                  ),
                )
              : const CustomLoader();
        }),
      ),
    );
  }

  String convertDate(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }
}
