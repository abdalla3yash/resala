import 'package:get/get_connect/http/src/response/response.dart';
import 'package:resala/base/constant.dart';
import 'package:resala/controller/data/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ActivityRepo {
  final ApiClient apiClient;
  SharedPreferences sharedPreferences;

  ActivityRepo({required this.apiClient, required this.sharedPreferences});
  Future<Response> getAllActivity() async {
    return await apiClient.getData(AppConstant.ACTIVITES_URL, headers: {
      'Authorization': '${sharedPreferences.getString(AppConstant.TOKEN)}',
    });
  }
}
