import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resala/views/widget/colors.dart';
import 'package:resala/views/widget/footer.dart';

class AbouUs extends StatelessWidget {
  const AbouUs({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        height: Get.context!.height * 0.05,
        width: Get.context!.height * 0.05,
        child: const Center(
          child: Image(
            image: AssetImage('assets/img/icon.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      onTap: () {
        showModalBottomSheet(
            context: context,
            isDismissible: true,
            enableDrag: true,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            builder: (context) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: Get.context!.width * 0.05,
                      right: Get.context!.width * 0.05),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: Get.context!.height * 0.02,
                          left: Get.context!.width * 0.05,
                          right: Get.context!.width * 0.05,
                          bottom: Get.context!.height * 0.02,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "جمعيه رساله ",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: Get.context!.height * 0.06,
                              width: Get.context!.height * 0.06,
                              child: const Center(
                                child: Image(
                                  image: AssetImage('assets/img/icon.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        "نشأت “رسالة” يوم 25 يونيو سنة 1999 كنشاط طلابي في كلية الهندسة بجامعة القاهرة على ايدي مجموعة من الطلاب الذين درسوا كورس اخلاقيات مهنة الهندسة في قسم هندسة  الاتصالات بالكلية على يد د. شريف عبد العظيم .",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: AppColors.hintTextColor, fontSize: 14),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "الان اصبح لرسالة اكثر من 60 فرعا منتشرة في انحاء مصر و يتطوع بها كل عام اكثر من 200 الف متطوع يخدمون ملايين المصريين في حوالي 30 نشاط تطوعي تشمل رعاية الايتام و خدمة المسنين و ايواء اطفال الشوارع و خدمة المكفوفين و الصم و ذوي الاحتياجات الخاصة و دروس التقوية المجانية و محو الامية و معارض الملابس المستعملة و التبرع بالدم و تعليم الكمبيوتر و اللغات و التنمية البشرية و القرآن الكريم و مساعدات للمحتاجين  و قوافل الخير للقرى الفقيرة و القوافل الطبية و علاج الادمان و اطعام المساكين و عمل مشاريع انتاجية للفقراء و اعمار المساجد و المدارس و تحقيق الاماني لاطفال السرطان و التوعية الاخلاقية للشباب و تنظيف الشوارع و الحدائق و نشر السرور بين الناس  و الرفق بالحيوان.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: AppColors.hintTextColor, fontSize: 12),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Footer(),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              );
            });
      },
    );
  }
}
