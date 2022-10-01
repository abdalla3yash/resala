import 'package:get/get.dart';
import 'package:resala/controller/repo/top_repo.dart';
import 'package:resala/model/models/top_model.dart';

class TopController extends GetxController implements GetxService {
  final TopRepo topRepo;
  TopController({required this.topRepo});

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  late TopModel _topModel;
  TopModel get topModel => _topModel;

  List<dynamic> _topModelList = [];
  List<dynamic> get activityModelList => _topModelList;

  Future<void> getAllTop() async {
    Response response = await topRepo.getAllTop();
    if (response.statusCode == 200) {
      _topModelList = [];
      _topModelList.addAll(TopModel.fromJson(response.body).data!);
      print("response bpdy is :  ${response.body}");
      print("activity Model List is :  ${_topModelList}");
      _isLoaded = true;
      update();
    } else {}
  }
}
