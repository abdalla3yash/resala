import 'package:get/get.dart';
import 'package:resala/controller/repo/home_repo.dart';
import 'package:resala/model/models/home_model.dart';

import 'auth_controller.dart';

class HomeController extends GetxController implements GetxService {
  final HomeRepo homeRepo;
  HomeController({required this.homeRepo});

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  late HomeModel _homeModel;
  HomeModel get homeModel => _homeModel;

  List<dynamic> _homeImagesList = [];
  List<dynamic> get homeImageList => _homeImagesList;

  Future<void> getHomeImages() async {
    Response response = await homeRepo.getHomeData();
    if (response.statusCode == 200) {
      _homeImagesList = [];
      _homeImagesList.addAll(HomeModel.fromJson(response.body).data!.images!);
      _isLoaded = true;
      update();
    } else {}
  }
}
