import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/other_helper.dart';

class ProfileController extends GetxController {
  String? image;

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  getProfileImage() async {
    image = await OtherHelper.openGallery();
    update();
  }
}
