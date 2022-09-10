import 'package:get/get.dart';
import 'package:resala/base/constant.dart';
import 'package:resala/controller/data/api.dart';
import 'package:resala/model/models/register_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({
    required this.apiClient,
    required this.sharedPreferences,
  });

  Future<Response> registeration(RegisterData model) async {
    return await apiClient.postData(
        AppConstant.REGISTERATION_URL, model.toJson());
  }

  Future<Response> getUserTypeList() async {
    return await apiClient.getData(AppConstant.USER_TYPE);
  }

  Future<Response> login(String email, String password) async {
    return await apiClient.postData(AppConstant.LOGIN_URL, {
      "email": email,
      "password": password,
    });
  }

  bool userLoggedIn() {
    return sharedPreferences.containsKey(AppConstant.TOKEN);
  }

  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeaders(token);
    return await sharedPreferences.setString(AppConstant.TOKEN, token);
  }

  Future<String> getUserToken() async {
    return sharedPreferences.getString(AppConstant.TOKEN) ?? "None";
  }

  Future<void> saveUserNumberAndPassword(String number, String password) async {
    try {
      await sharedPreferences.setString(AppConstant.NUMBER, number);
      await sharedPreferences.setString(AppConstant.PASSWORD, password);
    } catch (e) {
      rethrow;
    }
  }

  bool clearSharedData() {
    sharedPreferences.remove(AppConstant.TOKEN);
    sharedPreferences.remove(AppConstant.PASSWORD);
    sharedPreferences.remove(AppConstant.NUMBER);
    apiClient.token = '';
    apiClient.updateHeaders('');
    return true;
  }
}
