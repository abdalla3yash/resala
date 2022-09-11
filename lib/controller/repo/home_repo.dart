import 'package:get/get.dart';
import 'package:resala/base/constant.dart';
import 'package:resala/controller/data/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeRepo {
  final ApiClient apiClient;
  SharedPreferences sharedPreferences;

  HomeRepo({required this.apiClient, required this.sharedPreferences});
  Future<Response> getHomeData() async {
    return await apiClient.getData(AppConstant.HOME_URL, headers: {
      'Authorization': '${sharedPreferences.getString(AppConstant.TOKEN)}',
    });
  }
}
