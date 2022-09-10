import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resala/model/routes/router.dart';
import 'package:resala/views/widget/colors.dart';
import 'package:resala/views/widget/footer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: Get.context!.height * 0.08,
          ),
          SizedBox(
            height: Get.context!.height * 0.2,
            width: Get.context!.height * 0.2,
            child: const Center(
              child: Image(
                image: AssetImage('assets/img/logo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: Get.context!.height * 0.04,
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "  يوجد لجمعيه رساله اكثر من 60 فرعا منتشرة في انحاء مصر و يتطوع بها كل عام اكثر من 200 الف متطوع يخدمون ملايين المصريين في حوالي 30 نشاط تطوعي تشمل رعاية الايتام و خدمة المسنين و ايواء اطفال الشوارع و خدمة المكفوفين و الصم و ذوي الاحتياجات الخاصة و دروس التقوية المجانية و محو الامية و معارض الملابس المستعملة",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: AppColors.hintTextColor,
              ),
            ),
          ),
          SizedBox(
            height: Get.context!.height * 0.08,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.context!.width * 0.1),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(RouteHelper.getAuth());
              },
              child: Container(
                width: Get.context!.width * 0.8,
                height: Get.context!.height / 13,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AppColors.mainBlueColor,
                ),
                child: const Center(
                  child: Text(
                    "هيا بنا",
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 22,
                    ),
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
    );
  }
}
