import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vapeless/controllers/breathing_controller.dart';
import 'package:vapeless/helpers/my_extension.dart';
import 'package:vapeless/utils/app_images.dart';
import 'package:vapeless/utils/app_string.dart';
import 'package:vapeless/view/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:vapeless/view/component/button/common_button.dart';
import 'package:vapeless/view/component/image/common_image.dart';
import 'package:vapeless/view/component/text/common_text.dart';

import '../../utils/app_colors.dart';

class BreathingScreen extends StatefulWidget {
  const BreathingScreen({super.key});

  @override
  State<BreathingScreen> createState() => _BreathingScreenState();
}

class _BreathingScreenState extends State<BreathingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            CommonText(
              text: AppString.breathing,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            CommonText(
              text: AppString.findYourCalm,
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: AppColors.t2,
            ),
          ],
        ),
      ),
      body: GetBuilder<BreathingController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              20.height,
              AnimatedSwitcher(
                duration: const Duration(seconds: 3),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: controller.showFirst
                    ? GestureDetector(
                        onTapDown: controller.startBreathing,
                        onTapUp: controller.endBreathing,
                        child: Container(
                          key: const ValueKey(
                              1), // Unique key to identify widget

                          child: CommonImage(
                            imageSrc: AppImages.breathingOff,
                            imageType: ImageType.png,
                            height: 180,
                            width: 180,
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTapDown: controller.startBreathing,
                        onTapUp: controller.endBreathing,
                        child: Container(
                          key: const ValueKey(
                              2), // Different key for the second widget

                          child: CommonImage(
                            imageSrc: AppImages.breathingOn,
                            imageType: ImageType.png,
                            height: 180,
                            width: 180,
                          ),
                        ),
                      ),
              ).center,
              20.height,
              const CommonText(text: AppString.tapAndHoldToBreath),
              50.height,
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: AppColors.transparent,
                          border: Border.all(color: AppColors.t2),
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        children: [
                          const CommonText(
                            text: AppString.breaths,
                            color: AppColors.t2,
                            fontSize: 12,
                          ),
                          CommonText(
                            text: controller.breathCount.toString(),
                            fontSize: 24,
                            color: AppColors.nav,
                          ),
                        ],
                      ),
                    ),
                  ),
                  20.width,
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: AppColors.transparent,
                          border: Border.all(color: AppColors.t2),
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        children: [
                          const CommonText(
                            text: AppString.time,
                            color: AppColors.t2,
                            fontSize: 12,
                          ),
                          CommonText(
                            text: controller.time,
                            fontSize: 24,
                            color: AppColors.nav,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    color: AppColors.transparent,
                    border: Border.all(color: AppColors.t2),
                    borderRadius: BorderRadius.circular(12)),
                child: const CommonText(
                  text: AppString.breathDetails,
                  maxLines: 3,
                  textAlign: TextAlign.start,
                ),
              ),
              30.height,
              CommonButton(
                titleText: AppString.reset,
                onTap: controller.resetOnTap,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CommonBottomNavBar(currentIndex: 2),
    );
  }
}
