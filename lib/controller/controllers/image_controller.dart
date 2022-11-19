// import 'dart:io';

// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:resala/controller/repo/image_repo.dart';

// class ProfileController extends GetxController {
//   final ImageRepo imageRepo;
//   ProfileController({required this.imageRepo});

//   var isLoading = false.obs;
//   var imageURL = '';

//   void uploadImage(ImageSource imageSource) async {
//     try {
//       final pickedFile = await ImagePicker().getImage(source: imageSource);
//       isLoading(true);
//       if (pickedFile != null) {
//         var response =
//             await imageRepo.updateProfile(image: File(pickedFile.path));

//         if (response.statusCode == 200) {
//           //get image url from api response
//           imageURL = response.body['data']["image"];

//           Get.snackbar('Success', 'Image uploaded successfully',
//               margin: EdgeInsets.only(top: 5, left: 10, right: 10));
//         } else if (response.statusCode == 401) {
//           Get.offAllNamed('/sign_up');
//         } else {
//           Get.snackbar('Failed', 'Error Code: ${response.statusCode}',
//               margin: EdgeInsets.only(top: 5, left: 10, right: 10));
//         }
//       } else {
//         Get.snackbar('Failed', 'Image not selected',
//             margin: EdgeInsets.only(top: 5, left: 10, right: 10));
//       }
//     } finally {
//       isLoading(false);
//     }
//   }
// }
