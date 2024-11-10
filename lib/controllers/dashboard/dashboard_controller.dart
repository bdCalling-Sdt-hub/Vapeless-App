import 'dart:convert';

import 'package:get/get.dart';
import 'package:vapeless/models/api_response_model.dart';

import '../../services/api_service.dart';
import '../../utils/app_url.dart';
import '../../utils/app_utils.dart';

class DashboardController extends GetxController {
  Status status = Status.completed;

  int dailyAverage = 0;
  int longestStreak = 0;
  int currentGap = 0;

  getVapDashboard() async {
    status = Status.loading;
    update();

    var response = await ApiService.getApi(AppUrls.vapeStatisticsDashboard);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      dailyAverage = data['dailyAverage'] ?? 0;
      dailyAverage = data['longestStreak'] ?? 0;
      dailyAverage = data['currentGap'] ?? 0;

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
    getVapDashboard();
    super.onInit();
  }
}
