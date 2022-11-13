import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resala/controller/controllers/activity_controller.dart';
import 'package:resala/controller/controllers/home_controller.dart';
import 'package:resala/views/screen/home/add_post.dart';
import 'package:resala/views/widget/colors.dart';
import 'package:resala/views/widget/custom_loader.dart';
import 'package:resala/views/widget/post_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? _selectedIndex;

  @override
  void initState() {
    super.initState();
    Get.find<HomeController>().getActivityInList();
    Get.find<HomeController>().getHomeImages();
    Get.find<ActivityController>().getAllActivity();
  }

  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      floatingActionButton: const AddPost(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            sliderHomePage(),
            _getAllActivities(),
          ],
        ),
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
                    height: Get.context!.height * 0.02,
                  ),
                ],
              )
            : const CustomLoader();
      }),
    );
  }

  Widget _getAllActivities() {
    return GetBuilder<ActivityController>(builder: (activityController) {
      return activityController.isLoaded
          ? ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: activityController.activityModelList.length,
              itemBuilder: (context, index) {
                return activityController.activityModelList.isEmpty
                    ? const Center(child: Text("there is no data"))
                    : Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: BodyPost(
                            userName: activityController
                                .activityModelList[index].userName!,
                            details: activityController
                                .activityModelList[index].details!,
                            date: activityController
                                .activityModelList[index].activityDate!,
                            activityInName: activityController
                                .activityModelList[index].activityInName!,
                            activityTypeName: activityController
                                .activityModelList[index].activityTypeName!),
                      );
              })
          : const CustomLoader();
    });
  }
}
