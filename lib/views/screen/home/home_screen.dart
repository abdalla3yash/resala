import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resala/controller/controllers/activity_controller.dart';
import 'package:resala/controller/controllers/home_controller.dart';
import 'package:resala/views/widget/colors.dart';
import 'package:resala/views/widget/custom_loader.dart';
import 'package:resala/views/widget/exandable_text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<HomeController>().getHomeImages();
    Get.find<ActivityController>().getAllActivity();
  }

  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(children: [
          sliderHomePage(),
          SizedBox(
            height: Get.context!.height * 0.02,
          ),
          GetBuilder<ActivityController>(
            builder: ((activityController) {
              return activityController.isLoaded
                  ? Container(
                      width: Get.context!.width * 0.9,
                      height: Get.context!.height * 0.25,
                      padding: const EdgeInsets.all(10),
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
                              color: AppColors.mainBlueColor.withOpacity(0.15),
                            ),
                          ]),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey.shade100,
                                radius: Get.context!.width * 0.06,
                                child: Center(
                                  child: Image.asset(
                                    "assets/img/icon.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: Get.context!.width * 0.03,
                              ),
                              Text(
                                activityController
                                    .activityModelList[0].userName!,
                                style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 14,
                                  color: AppColors.blackColor,
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  activityController
                                      .activityModelList[0].activityDate!,
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: AppColors.hintTextColor),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Text(
                              activityController.activityModelList[0].details!,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              softWrap: true,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.edit_location_alt,
                                      color: AppColors.mainBlueColor,
                                      size: 16,
                                    ),
                                    SizedBox(width: Get.context!.width * 0.01),
                                    Text(
                                      "في المنزل",
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: AppColors.hintTextColor),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.workspace_premium_outlined,
                                      color: AppColors.mainRedColor,
                                      size: 16,
                                    ),
                                    SizedBox(width: Get.context!.width * 0.01),
                                    Text(
                                      "اداريات",
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: AppColors.hintTextColor),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  : const CustomLoader();
            }),
          ),
        ]),
      ),
    );
  }

  Widget sliderHomePage() {
    return GetBuilder<HomeController>(
      builder: ((homeController) {
        return homeController.isLoaded
            ? Column(
                children: [
                  SizedBox(
                    height: Get.context!.height * 0.05,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Get.context!.width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "نهارك سعيد، \nهتساعد بإيه انهارده..",
                          style: TextStyle(
                              fontSize: Get.context!.width * 0.07,
                              fontFamily: "arslan"),
                        ),
                        SizedBox(
                          height: Get.context!.height * 0.05,
                          width: Get.context!.height * 0.05,
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
                  SizedBox(
                    height: Get.context!.height * 0.01,
                  ),
                  CarouselSlider(
                    items: homeController.homeImageList
                        .map(
                          (item) => Container(
                            margin: const EdgeInsets.only(
                              top: 10,
                              left: 5,
                              right: 5,
                              bottom: 10,
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  15.0,
                                ),
                              ),
                              child: Stack(
                                children: <Widget>[
                                  Image.network(
                                    item,
                                    fit: BoxFit.cover,
                                    width: 1000.0,
                                  ),
                                  Positioned(
                                    bottom: 0.0,
                                    left: 0.0,
                                    right: 0.0,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            AppColors.mainBlueColor,
                                            Color.fromARGB(0, 0, 0, 0)
                                          ],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                        ),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10.0,
                                        horizontal: 20.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    carouselController: _controller,
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        setState(
                          () {
                            _current = index;
                          },
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: homeController.homeImageList.asMap().entries.map(
                      (entry) {
                        return GestureDetector(
                          onTap: () => _controller.animateToPage(entry.key),
                          child: Container(
                            width: 6.0,
                            height: 6.0,
                            margin: const EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 5.0,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (AppColors.mainRedColor).withOpacity(
                                _current == entry.key ? 0.7 : 0.3,
                              ),
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                  SizedBox(
                    height: Get.context!.height * 0.04,
                  ),
                ],
              )
            : const CustomLoader();
      }),
    );
  }
}
