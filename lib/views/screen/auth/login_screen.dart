import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resala/controller/controllers/auth_controller.dart';
import 'package:resala/model/routes/router.dart';
import 'package:resala/views/screen/auth/forget_pass_screen.dart';
import 'package:resala/views/widget/app_text_field.dart';
import 'package:resala/views/widget/colors.dart';
import 'package:resala/views/widget/custom_loader.dart';
import 'package:resala/views/widget/custom_snackbar.dart';
import 'package:resala/views/widget/footer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    void login(AuthController authController) {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      if (email.isEmpty) {
        showCustomSnackBar("لقد نسيت البريد الالكتروني", title: "هنالك خطأ");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar("أدخل عنوان بريد صالح", title: "عفوآ");
      } else if (password.isEmpty) {
        showCustomSnackBar("لقد نسيت كلمه السر", title: "عفوآ");
      } else if (password.length < 6) {
        showCustomSnackBar("كلمه السر يجب أن تكون أكثر من 6 أرقام",
            title: "هنالك خطأ");
      } else {
        authController.login(email, password).then((status) {
          if (status.isSuccess) {
            Get.toNamed(RouteHelper.getinitial());
          } else {
            showCustomSnackBar(status.message, title: "عفوآ");
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
                        height: Get.context!.height * 0.05,
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
                        textController: passwordController,
                        hintText: "كلمه السر",
                        icon: Icons.lock,
                        obsecure: true,
                      ),
                      SizedBox(
                        height: Get.context!.height * 0.02,
                      ),
                      GestureDetector(
                        onTap: () => Get.to(const ForgetPasswordScreen()),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: Get.context!.height * 0.04,
                            ),
                            child: Text(
                              "هل نسيت كلمه السر؟",
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.mainRedColor.withOpacity(0.6),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.context!.height * 0.04,
                      ),
                      GestureDetector(
                        onTap: () {
                          login(controller);
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
                              "تسجيل الدخول",
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.context!.height * 0.1,
                      ),
                      const Footer(),
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
