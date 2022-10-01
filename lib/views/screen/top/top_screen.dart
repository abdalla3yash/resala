import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resala/controller/controllers/top_controller.dart';
import 'package:resala/views/widget/colors.dart';
import 'package:resala/views/widget/custom_loader.dart';
import 'package:resala/views/widget/post_body.dart';
import 'package:resala/views/widget/top_widget.dart';

class TopScreen extends StatefulWidget {
  const TopScreen({super.key});

  @override
  State<TopScreen> createState() => _TopScreenState();
}

class _TopScreenState extends State<TopScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<TopController>().getAllTop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Column(
          children: [
            const SizedBox(height: 100),
            _getAllActivities(),
          ],
        ));
  }

  Widget _getAllActivities() {
    return GetBuilder<TopController>(builder: (topController) {
      return topController.isLoaded
          ? ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: topController.topModelList.length,
              itemBuilder: (context, index) {
                return topController.topModelList.isEmpty
                    ? Center(child: Text("there is no data"))
                    : Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: Get.context!.width * 0.1,
                                width: Get.context!.width * 0.1,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(
                                      Get.context!.width * 0.1),
                                  image: DecorationImage(
                                    image: topController
                                                .topModelList[index].image ==
                                            null
                                        ? const NetworkImage(
                                            "https://pbs.twimg.com/profile_images/1449157560783757313/IjCnPLBx_400x400.jpg")
                                        : NetworkImage(
                                            "${topController.topModelList[index].image!}"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Flexible(
                                child: Container(
                                  margin: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              topController.topModelList[index]
                                                  .userName!,
                                              style: const TextStyle(
                                                color: AppColors.hintTextColor,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            topController.topModelList[index]
                                                .userTypeName!,
                                            style: const TextStyle(
                                              color: AppColors.hintTextColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 5.0),
                                        child: Text(
                                          "عدد المشاركات : ${topController.topModelList[index].activityCount!}",
                                          style: const TextStyle(
                                            color: AppColors.blackColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
              })
          : const CustomLoader();
    });
  }
}
