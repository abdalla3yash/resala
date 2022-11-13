import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:resala/base/constant.dart';
import 'package:resala/controller/repo/home_repo.dart';
import 'package:resala/model/models/activity_in_model.dart';
import 'package:resala/model/models/activity_type_model.dart';
import 'package:resala/model/models/add_post_model.dart';
import 'package:resala/model/models/home_model.dart';
import 'package:resala/model/models/res_model.dart';
import 'package:resala/model/models/response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController implements GetxService {
  final _connect = GetConnect();

  final HomeRepo homeRepo;
  HomeController({required this.homeRepo});

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  late HomeModel _homeModel;
  HomeModel get homeModel => _homeModel;

  List<dynamic> _homeImagesList = [];
  List<dynamic> get homeImageList => _homeImagesList;

  List<dynamic> _activityInList = [];
  List<dynamic> get activityInList => _activityInList;

  List<dynamic> _activityTypeList = [];
  List<dynamic> get ActivityTypeList => _activityTypeList;

  Future<void> getHomeImages() async {
    Response response = await homeRepo.getHomeData();
    if (response.statusCode == 200) {
      _homeImagesList = [];
      _homeImagesList.addAll(HomeModel.fromJson(response.body).data!.images!);
      _isLoaded = true;
      update();
    } else {}
  }

  Future<void> getActivityInList() async {
    Response response = await homeRepo.getActivityIn();
    if (response.statusCode == 200) {
      _activityInList = [];
      _activityInList.addAll(ActivityIn.fromJson(response.body).data!);
      _isLoaded = true;
      update();
    } else {}
  }

  Future<ResModel> activityType(String activityInId) async {
    _isLoaded = false;
    update();
    final response = await homeRepo.activityType(activityInId);
    late ResModel responseModel;
    if (response.statusCode == 200) {
      _activityTypeList = [];
      _activityTypeList.addAll(ActivityTypeModel.fromJson(response.body).data!);
      responseModel = ResModel(true, response.body);
    } else {
      responseModel = ResModel(false, response.body);
    }
    _isLoaded = true;
    update();
    return responseModel;
  }

  Future<ResModel> addPost({
    required String activityInId,
    required String activityTypeId,
    required String details,
    required String activityDate,
  }) async {
    _isLoaded = false;
    update();
    final response = await homeRepo.addPost(
      activityDate: activityDate,
      activityInId: activityInId,
      activityTypeId: activityTypeId,
      details: details,
    );
    late ResModel responseModel;
    if (response.statusCode == 200) {
      responseModel = ResModel(true, response.body);
    }
    _isLoaded = true;
    update();
    return responseModel;
  }
}
