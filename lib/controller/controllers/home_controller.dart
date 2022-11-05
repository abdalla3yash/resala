import 'package:get/get.dart';
import 'package:resala/controller/repo/home_repo.dart';
import 'package:resala/model/models/activity_in_model.dart';
import 'package:resala/model/models/home_model.dart';
import 'package:resala/model/models/response_model.dart';

class HomeController extends GetxController implements GetxService {
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

  // Future<ResponseModel> ActivityType(String activityIn) async {
  //   _isLoaded = false;
  //   update();
  //   Response response = await homeRepo.ActivityType(activityIn);
  //   late ResponseModel responseModel;
  //   if (response.statusCode == 200) {
  //     print("responseeeeeeeee ${response.body}");
  //     responseModel = ResponseModel(true, response.body);
  //   } else {
  //     responseModel = ResponseModel(false, response.statusText!);
  //   }
  //   _isLoaded = true;
  //   update();
  //   return responseModel;
  // }
}
