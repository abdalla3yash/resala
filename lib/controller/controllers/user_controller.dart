import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resala/controller/repo/user_repo.dart';
import 'package:resala/model/models/res_model.dart';
import 'package:resala/model/models/response_model.dart';
import 'package:resala/model/models/user_model.dart';

class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;
  UserController({required this.userRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  late UserModel _userModel;
  UserModel get userModel => _userModel;

  Future<ResponseModel> getUserInfo() async {
    Response response = await userRepo.getUserInfo();
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      _userModel = UserModel.fromJson(response.body);
      _isLoading = true;
      responseModel = ResponseModel(true, "Successfully");
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    update();
    return responseModel;
  }

  Future<ResModel> updateProfile({
    required String image,
    required String username,
    required String mobile,
    required String password,
  }) async {
    _isLoading = false;
    update();
    final response = await userRepo.updateProfile(
      image: image,
      username: username,
      mobile: mobile,
      password: password,
    );
    late ResModel responseModel;
    if (response.statusCode == 200) {
      responseModel = ResModel(true, response.body);
    }
    _isLoading = true;
    update();
    return responseModel;
  }

  late File image;
  late String imagePath;
  late final _picker = ImagePicker();

  Future<void> getImage() async {
    final pickedFile = await _picker.getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      imagePath = pickedFile.path;
      print(imagePath);
      update();
    } else {
      print('No image selected.');
    }
  }
}
