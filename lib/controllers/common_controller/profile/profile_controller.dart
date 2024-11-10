import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vapeless/models/user_model.dart';

import '../../../helpers/app_routes.dart';
import '../../../helpers/other_helper.dart';
import '../../../services/api_service.dart';
import '../../../utils/app_url.dart';
import '../../../utils/app_utils.dart';

class ProfileController extends GetxController {
  String? image;

  bool isLoading = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  UserModel userModel = UserModel.fromJson({});

  getProfileImage() async {
    image = await OtherHelper.openGallery();
    update();
  }

  updateProfileRepo() async {
    isLoading = true;
    update();
    var body = {
      "fullName": nameController.text,
    };

    var response = await ApiService.multipartRequest(
      url: AppUrls.user,
      body: {"data": jsonEncode(body)},
      method: "PUT",
      imagePath: image,
      imageName: "profileImage",
    );

    if (response.statusCode == 200) {
      await getProfileRepo();
      Get.back();

      if (kDebugMode) {
        print(response.body);
      }
    } else {
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }

    isLoading = false;
    update();
  }

  getProfileRepo() async {
    var response = await ApiService.getApi(AppUrls.profile);
    if (response.statusCode == 200) {
      userModel =
          UserModel.fromJson(jsonDecode(response.body)['data']['attributes']);

      nameController.text = userModel.fullName;
    }

    update();
  }

  @override
  void onInit() {
    getProfileRepo();
    super.onInit();
  }
}
