import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resala/views/screen/auth/forget_pass_screen.dart';
import 'package:resala/views/widget/app_text_field.dart';
import 'package:resala/views/widget/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
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
                    right: Get.context!.height * 0.05,
                  ),
                  child: const Text(
                    "هل نسيت كلمه السر؟",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.context!.height * 0.05,
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
            const Align(
                alignment: Alignment.center,
                child: Text(
                  "نرحب بتواصلكم معنا",
                  style: TextStyle(fontSize: 18),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "19450",
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.phone,
                  size: 16,
                  color: AppColors.mainBlueColor,
                ),
                SizedBox(
                  width: 5,
                ),
                VerticalDivider(),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "contact_us@resala.org",
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.mail,
                  size: 16,
                  color: AppColors.mainRedColor,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
