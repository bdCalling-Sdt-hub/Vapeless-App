import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetGoalController extends GetxController {
  TextEditingController dateController = TextEditingController();

  Future<void> selectDate() async {
    DateTime? selectedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      dateController.text =
          selectedDate.toString().substring(0, 10); // Formatting as YYYY-MM-DD
      update();
    }
  }
}
