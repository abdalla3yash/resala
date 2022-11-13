import 'package:get/get.dart';
import 'package:resala/base/constant.dart';
import 'package:resala/controller/data/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeRepo {
  final ApiClient apiClient;
  SharedPreferences sharedPreferences;
  final _connect = GetConnect();

  HomeRepo({required this.apiClient, required this.sharedPreferences});
  Future<Response> getHomeData() async {
    return await apiClient.getData(AppConstant.HOME_URL, headers: {
      'Authorization': '${sharedPreferences.getString(AppConstant.TOKEN)}',
    });
  }

  Future<Response> getActivityIn() async {
    return await apiClient.getData(AppConstant.ACTIVITY_IN_URL, headers: {
      'Authorization': '${sharedPreferences.getString(AppConstant.TOKEN)}',
    });
  }

  Future<Response> activityType(String activityInId) async {
    return await _connect.post(AppConstant.ACTIVITY_TYPE_URL, {
      "activity_in_id": activityInId,
    }, headers: {
      'Authorization': '${sharedPreferences.getString(AppConstant.TOKEN)}',
    });
  }

  Future<Response> addPost(String activityInId, String activityTypeId,
      String details, String activityDate) async {
    return await _connect.post(AppConstant.ACTIVITY_TYPE_URL, {
      "activity_in_id": activityInId,
      "activity_type_id": activityTypeId,
      "details": details,
      "activity_date": activityDate,
    }, headers: {
      'Authorization': '${sharedPreferences.getString(AppConstant.TOKEN)}',
    });
  }
}
