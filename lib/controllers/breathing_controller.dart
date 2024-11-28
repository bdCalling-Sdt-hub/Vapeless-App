import 'dart:async';

import 'package:get/get.dart';

class BreathingController extends GetxController {
  bool showFirst = false;

  int breathCount = 0;

  Timer? _timer;
  int start = 0;

  String time = "00:00";

  startBreathing(details) {
    showFirst = !showFirst;

    update();
    startTimer();
  }

  endBreathing(details) {
    showFirst = !showFirst;
    breathCount++;
    update();

    _timer?.cancel();
    time = "00:00";
  }

  void startTimer() {
    _timer?.cancel(); // Cancel any existing timer
    start = 0; // Reset the start value
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      start++;
      final minutes = (start ~/ 60).toString().padLeft(2, '0');
      final seconds = (start % 60).toString().padLeft(2, '0');

      time = "$minutes:$seconds";

      update();
    });
  }

  resetOnTap() {
    breathCount = 0;
    update();
  }
}
