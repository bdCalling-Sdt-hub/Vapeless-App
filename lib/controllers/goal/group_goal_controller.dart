import 'dart:convert';

import 'package:get/get.dart';
import 'package:vapeless/models/api_response_model.dart';
import 'package:vapeless/models/group_goal_model.dart';
import 'package:vapeless/utils/app_images.dart';

import '../../services/api_service.dart';
import '../../utils/app_url.dart';
import '../../utils/app_utils.dart';

class GroupGoalsController extends GetxController {
  Status status = Status.completed;

  GroupGoalModel groupGoalModel = GroupGoalModel.fromJson({});

  double sliderValue = 50;
  List teamList = [
    {"name": "you", "point": "250", "image": AppImages.you},
    {"name": "Alex", "point": "250", "image": AppImages.alex},
    {"name": "James lo.", "point": "250", "image": AppImages.james},
    {"name": "Anjilo", "point": "250", "image": AppImages.anjilo},
  ];

  changeSliderValue(double value) {
    sliderValue = value;
    update();
  }

  getGroupGoalRepo() async {
    status = Status.loading;
    update();

    var response = await ApiService.getApi(AppUrls.groups);

    if (response.statusCode == 200) {
      groupGoalModel = GroupGoalModel.fromJson(jsonDecode(response.body));
      status = Status.completed;
      update();
    } else {
      status = Status.error;
      update();
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }

  @override
  void onInit() {
    getGroupGoalRepo();
    super.onInit();
  }
}
