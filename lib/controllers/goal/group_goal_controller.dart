import 'package:get/get.dart';
import 'package:vapeless/utils/app_images.dart';

class GroupGoalsController extends GetxController {
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
}
