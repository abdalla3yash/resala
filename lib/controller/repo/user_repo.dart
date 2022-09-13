import 'package:get/get.dart';
import 'package:resala/base/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/api.dart';

class UserRepo {
  final ApiClient apiClient;
  SharedPreferences sharedPreferences;

  UserRepo({required this.apiClient, required this.sharedPreferences});
  Future<Response> getUserInfo() async {
    return await apiClient.getData(AppConstant.USER_URL, headers: {
      'Authorization': '${sharedPreferences.getString(AppConstant.TOKEN)}',
    });
  }
}
