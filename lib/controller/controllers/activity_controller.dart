import 'package:get/get.dart';
import 'package:resala/controller/repo/activity_repo.dart';
import 'package:resala/model/models/activity_model.dart';

class ActivityController extends GetxController implements GetxService {
  final ActivityRepo activityRepo;
  ActivityController({required this.activityRepo});

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  late ActivityModel _activityModel;
  ActivityModel get activityModel => _activityModel;

  List<dynamic> _activityModelList = [];
  List<dynamic> get activityModelList => _activityModelList;

  Future<void> getAllActivity() async {
    Response response = await activityRepo.getAllActivity();
    if (response.statusCode == 200) {
      _activityModelList = [];
      _activityModelList.addAll(ActivityModel.fromJson(response.body).data!);
      print("response bpdy is :  ${response.body}");
      print("activity Model List is :  ${_activityModelList}");
      _isLoaded = true;
      update();
    } else {}
  }
}
