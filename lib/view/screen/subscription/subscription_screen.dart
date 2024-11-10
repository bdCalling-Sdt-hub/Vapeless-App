import 'package:carousel_slider/carousel_slider.dart' as slider;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vapeless/utils/app_string.dart';
import 'package:vapeless/view/screen/subscription/widgets/premium_subcription.dart';
import '../../../controllers/subscription_controller.dart';
import '../../component/text/common_text.dart';
import 'widgets/free_subscription.dart';

class SubscriptionScreen extends StatelessWidget {
  SubscriptionScreen({super.key});

  static RxInt currentIndex = (-1).obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const CommonText(
            text: AppString.subscription,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        body: GetBuilder<SubscriptionController>(
          builder: (controller) => slider.CarouselSlider(
            options: slider.CarouselOptions(
              autoPlay: false,
              height: Get.height * 0.75,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              autoPlayCurve: Curves.easeInOut,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                currentIndex.value = index;
              },
            ),
            items: [
              if (controller.subscription.isNotEmpty)
                FreeSubscription(
                  subscriptionModel: controller.subscription[0],
                ),
              if (controller.subscription.length >= 2)
                PremiumSubcription(
                  subscriptionModel: controller.subscription[1],
                ),
            ],
          ),
        ));
  }
}
