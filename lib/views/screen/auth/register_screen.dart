import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:resala/controller/controllers/auth_controller.dart';
import 'package:resala/model/models/register_model.dart';
import 'package:resala/model/routes/router.dart';
import 'package:resala/views/widget/app_text_field.dart';
import 'package:resala/views/widget/colors.dart';
import 'package:resala/views/widget/custom_loader.dart';
import 'package:resala/views/widget/custom_snackbar.dart';
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
    var passwordController = TextEditingController();
    int? defaultChoiceIndex;

    void registeration(AuthController authController) {
      String name = nameController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      String phone = phoneController.text.trim();
      String username = usernameController.text.trim();
      String nationalID = nationalIDController.text.trim();
      String userType = defaultChoiceIndex.toString();
      String birthDay = dateSub.toString();

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
      } else if (userType.isEmpty) {
        showCustomSnackBar("من فضلك يجب اختيار نوع المسئوليه",
            title: "نوع المسئوليه");
      } else if (password.isEmpty) {
        showCustomSnackBar("من فضلك أدخل كلمه السر", title: "كلمه السر");
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
        RegisterModel registermodel = RegisterModel(
          name: name,
          nationalId: nationalID,
          birthDate: birthDay,
          email: email,
          userName: username,
          mobile: phone,
          userTypeId: userType,
          image: "assets/img/profile.jpg",
        );
        authController.registeration(registermodel).then((status) {
          if (status.isSuccess) {
            Get.offNamed(RouteHelper.getHome());
          } else {
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    List<String> choicesList = [
      "مسئول",
      "متطوع",
      "مركزي / مدير",
    ];
    List<String> _locations = ['A', 'B', 'C', 'D']; // Option 2
    String? _selectedLocation; // Option 2

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
                                  lastDate: DateTime.now(),
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
                        spacing: 8,
                        children: List.generate(
                          choicesList.length,
                          (index) {
                            return ChoiceChip(
                              labelPadding: const EdgeInsets.all(2.0),
                              label: Text(
                                choicesList[index],
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                              ),
                              selected: defaultChoiceIndex == index,
                              selectedColor: AppColors.mainBlueColor,
                              onSelected: (value) {
                                setState(
                                  () {
                                    defaultChoiceIndex =
                                        value ? index : defaultChoiceIndex;
                                  },
                                );
                              },
                              elevation: 1,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: Get.context!.height * 0.04,
                      ),
                      DropdownButton(
                        hint: Text(_selectedLocation!.isEmpty
                            ? 'Please choose a location'
                            : _selectedLocation
                                .toString()), // Not necessary for Option 1
                        value: _selectedLocation,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedLocation = newValue;
                          });
                        },
                        items: _locations.map((location) {
                          return DropdownMenuItem(
                            child: Text(location),
                            value: location,
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        height: Get.context!.height * 0.04,
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
              : const CustomLoader();
        }),
      ),
    );
  }

  String convertDate(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }
}
