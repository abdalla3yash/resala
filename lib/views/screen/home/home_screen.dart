import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resala/controller/controllers/auth_controller.dart';
import 'package:resala/model/routes/router.dart';
import 'package:resala/views/widget/colors.dart';
import 'package:resala/views/widget/custom_loader.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainRedColor,
        title: Text(
          "رساله",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        leading: GetBuilder<AuthController>(
          builder: ((controller) {
            return !controller.isLoading
                ? IconButton(
                    onPressed: () {
                      Get.find<AuthController>().clearSharedData();
                      Get.offNamed(RouteHelper.getSplash());
                    },
                    icon: Icon(Icons.logout),
                  )
                : CustomLoader();
          }),
        ),
      ),
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: Text("الصفحه الرئيسيه تحت الانشاء"),
      ),
    );
  }
}
