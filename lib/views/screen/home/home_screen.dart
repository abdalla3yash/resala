import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resala/controller/controllers/auth_controller.dart';
import 'package:resala/controller/controllers/home_controller.dart';
import 'package:resala/model/routes/router.dart';
import 'package:resala/views/widget/colors.dart';
import 'package:resala/views/widget/custom_loader.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainRedColor,
        title: const Text(
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
      body: GetBuilder<HomeController>(
        builder: ((homeController) {
          return homeController.isLoaded
              ? Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 1.8,
                        enlargeCenterPage: true,
                      ),
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
                                              Color.fromARGB(200, 0, 0, 0),
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
                    ),
                  ],
                )
              : CustomLoader();
        }),
      ),
    );
  }
}
