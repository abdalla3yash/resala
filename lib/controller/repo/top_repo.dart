import 'package:get/get_connect/http/src/response/response.dart';
import 'package:resala/base/constant.dart';
import 'package:resala/controller/data/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TopRepo {
  final ApiClient apiClient;
  SharedPreferences sharedPreferences;

  TopRepo({required this.apiClient, required this.sharedPreferences});
  Future<Response> getAllTop() async {
    return await apiClient.getData(AppConstant.TOP_FIVE_URL, headers: {
      'Authorization': '${sharedPreferences.getString(AppConstant.TOKEN)}',
    });
  }
}
