import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vapeless/helpers/app_routes.dart';

import '../services/api_service.dart';
import '../utils/app_url.dart';
import '../utils/app_utils.dart';

class QuestionController extends GetxController {
  int index = 0;

  TextEditingController noOfVapePerDayController = TextEditingController();

  TextEditingController investPerMonthController = TextEditingController();

  TextEditingController noOfMlPerVapeController = TextEditingController();

  bool triedQuitBefore = false;

  bool isForManagingStress = false;

  bool isLoading = false;

  List questionList = [
    "How often do you vape each day?",
    "How much do you spend on vaping each month?",
    "How many mls is your vape?",
    "Have you tried quitting before?",
    "Do you use vaping to manage stress?",
  ];

  ansOnTap(bool value) {
    print(value);
    if (index == 3) {
      triedQuitBefore = value;
    }

    if (index == 4) {
      isForManagingStress = value;
      vapInfoRepo();
    }
    if (index < 4) {
      index++;
      update();
    }
  }

  nextQuestion() {
    index++;
    update();
  }

  Future<void> vapInfoRepo() async {
    isLoading = true;
    update();


    Map body = {
      "noOfVapePerDay": noOfVapePerDayController.text,
      "investPerMonth": investPerMonthController.text,
      "noOfMlPerVape": noOfMlPerVapeController.text,
      "triedQuitBefore": triedQuitBefore,
      "isForManagingStress": isForManagingStress
    };

    var response = await ApiService.postApi(
      AppUrls.vapingInfo,
      body,
    );

    if (response.statusCode == 200) {
      Get.toNamed(AppRoutes.vapelessProfile);
    } else {
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }

    isLoading = false;
    update();
  }
}
