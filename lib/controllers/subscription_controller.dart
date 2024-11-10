import 'dart:convert';

import 'package:get/get.dart';
import 'package:vapeless/models/api_response_model.dart';
import 'package:vapeless/models/subscription_model.dart';

import '../services/api_service.dart';
import '../utils/app_string.dart';
import '../utils/app_url.dart';
import '../utils/app_utils.dart';

class SubscriptionController extends GetxController {
  Status status = Status.completed;

  List<SubscriptionModel> subscription = [];

  static SubscriptionController get instance =>
      Get.put(SubscriptionController());

  getVapDashboard() async {
    status = Status.loading;
    update();

    var response = await ApiService.getApi(AppUrls.subscriptions);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data']["attributes"];

      for (var item in data) {
        subscription.add(SubscriptionModel.fromJson(item));
      }

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
