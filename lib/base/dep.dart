import 'package:get/get.dart';
import 'package:resala/base/constant.dart';
import 'package:resala/controller/controllers/activity_controller.dart';
import 'package:resala/controller/controllers/auth_controller.dart';
import 'package:resala/controller/controllers/home_controller.dart';
import 'package:resala/controller/controllers/image_controller.dart';
import 'package:resala/controller/controllers/top_controller.dart';
import 'package:resala/controller/controllers/user_controller.dart';
import 'package:resala/controller/repo/activity_repo.dart';
import 'package:resala/controller/repo/auth_repo.dart';
import 'package:resala/controller/repo/home_repo.dart';
import 'package:resala/controller/repo/image_repo.dart';
import 'package:resala/controller/repo/top_repo.dart';
import 'package:resala/controller/repo/user_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/data/api.dart';

Future<void> init() async {
  // local user data
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  // api client
  Get.lazyPut(() => ApiClient(
      appBaseURL: AppConstant.BASE_URL, sharedPreferences: Get.find()));

  // repos
  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(
      () => HomeRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(
      () => UserRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(
      () => ActivityRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(
      () => TopRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(
      () => ImageRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  // controllers
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => HomeController(homeRepo: Get.find()));
  Get.lazyPut(() => UserController(userRepo: Get.find()));
  Get.lazyPut(() => ActivityController(activityRepo: Get.find()));
  Get.lazyPut(() => TopController(topRepo: Get.find()));
  Get.lazyPut(() => ImageController(imageRepo: Get.find()));
}
