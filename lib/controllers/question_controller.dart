import 'package:get/get.dart';
import 'package:vapeless/helpers/app_routes.dart';

class QuestionController extends GetxController {
  int index = 0;

  List questionList = [
    "How often do you vape each day?",
    "How much do you spend on vaping each month?",
    "How many mls is your vape?",
    "Have you tried quitting before?",
    "Do you use vaping to manage stress?",
  ];

  nextQuestion() {
    if (index < 4) {
      index++;
      update();
    } else {
      Get.toNamed(AppRoutes.vapelessProfile);
      index = 0;
      update();
    }
  }
}
