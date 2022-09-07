import 'package:get/get.dart';
import 'package:resala/base/constant.dart';
import 'package:resala/controller/controllers/auth_controller.dart';
import 'package:resala/controller/repo/auth_repo.dart';
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

  // controllers
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
}