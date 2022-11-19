// import 'dart:io';

// import 'package:get/get.dart';
// import 'package:resala/base/constant.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../data/api.dart';

// class ImageRepo {
//   final ApiClient apiClient;
//   SharedPreferences sharedPreferences;
//   final _connect = GetConnect();

//   ImageRepo({required this.apiClient, required this.sharedPreferences});

//   Future<Response> updateProfile({
//     String? username,
//     String? mobile,
//     File? image,
//     String? password,
//   }) async {
//     return await _connect.post(AppConstant.USER_POST_URL, {
//       "user_name": "help",
//       "mobile": "1020130",
//       "image": image,
//       "password": "123456",
//     }, headers: {
//       'Authorization': '${sharedPreferences.getString(AppConstant.TOKEN)}',
//     });
//   }
// }
