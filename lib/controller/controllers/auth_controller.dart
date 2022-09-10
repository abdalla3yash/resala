import 'package:get/get.dart';
import 'package:resala/controller/repo/auth_repo.dart';
import 'package:resala/model/models/register_model.dart';
import 'package:resala/model/models/response_model.dart';
import 'package:resala/model/models/user_type_model.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  AuthController({required this.authRepo});

  List<dynamic> _userTypeList = [];
  List<dynamic> get UserTypeList => _userTypeList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResponseModel> registeration({
    required String email,
    required String password,
    required String mobile,
    required String name,
    required String user_name,
    required String national_id,
    required String birth_date,
    required String user_type_id,
  }) async {
    _isLoading = true;
    update();
    Response response = await authRepo.registeration(
      email,
      password,
      mobile,
      name,
      user_name,
      national_id,
      birth_date,
      user_type_id,
    );
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      print("registeration here ${response.body['data']["api_token"]}");
      authRepo.saveUserToken(response.body["data"]['api_token']);
      print("registeration here ${response.body['data']["api_token"]}");
      responseModel = ResponseModel(true, response.body['data']["api_token"]);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> login(String email, String password) async {
    _isLoading = true;
    update();
    Response response = await authRepo.login(email, password);
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      authRepo.saveUserToken(response.body['data']["api_token"]);
      print(response.body['data']["api_token"]);
      responseModel = ResponseModel(true, response.body['data']["api_token"]);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<void> getUserTypeList() async {
    Response response = await authRepo.getUserTypeList();
    if (response.statusCode == 200) {
      _userTypeList = [];
      _userTypeList.addAll(UserType.fromJson(response.body).data!);
      _isLoading = false;
      update();
    } else {}
  }

  void saveUserNumberAndPassword(String number, String password) {
    authRepo.saveUserNumberAndPassword(number, password);
  }

  bool userLoggedIn() {
    return authRepo.userLoggedIn();
  }

  bool clearSharedData() {
    return authRepo.clearSharedData();
  }
}
