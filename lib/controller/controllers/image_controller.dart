import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resala/controller/repo/image_repo.dart';
import 'package:resala/model/models/response_model.dart';

class ImageController extends GetxController {
  final ImageRepo imageRepo;
  ImageController({required this.imageRepo});

  static ImageController get to => Get.find<ImageController>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  File? image;
  String? imagePath;
  final _picker = ImagePicker();

  Future updateImage({
    required File image,
    String? mobile,
    String? password,
    String? userName,
  }) async {
    _isLoading = true;
    update();
    final response = await imageRepo.updateProfile(
        image: image, mobile: mobile, password: password, username: userName);
    late ResponseModel responseModel;

    try {
      responseModel = ResponseModel(true, response.body);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }
}
