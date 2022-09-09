import 'package:get/get.dart';
import 'package:resala/controller/repo/auth_repo.dart';
import 'package:resala/model/models/register_model.dart';
import 'package:resala/model/models/response_model.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  AuthController({required this.authRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResponseModel> registeration(RegisterModel model) async {
    _isLoading = true;
    update();
    Response response = await authRepo.registeration(model);
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      authRepo.saveUserToken(response.body['data']['api_token']);
      responseModel = ResponseModel(true, response.body['data']['api_token']);
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
      responseModel = ResponseModel(true, response.body['data']["api_token"]);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
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
