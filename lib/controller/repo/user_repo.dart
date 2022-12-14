import 'package:get/get.dart';
import 'package:resala/base/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/api.dart';

class UserRepo {
  final ApiClient apiClient;
  SharedPreferences sharedPreferences;
  final _connect = GetConnect();

  UserRepo({required this.apiClient, required this.sharedPreferences});
  Future<Response> getUserInfo() async {
    return await apiClient.getData(AppConstant.USER_URL, headers: {
      'Authorization': '${sharedPreferences.getString(AppConstant.TOKEN)}',
    });
  }

  Future<Response> updateProfile({
    String? username,
    String? mobile,
    String? image,
    String? password,
  }) async {
    return await _connect.post(AppConstant.USER_POST_URL, {
      "user_name": username,
      "mobile": mobile,
      "image": image,
      "password": password,
    }, headers: {
      'Authorization': '${sharedPreferences.getString(AppConstant.TOKEN)}',
    });
  }
}
