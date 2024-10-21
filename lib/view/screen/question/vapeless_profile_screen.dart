import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:vapeless/controllers/question_controller.dart';
import 'package:vapeless/helpers/app_routes.dart';
import 'package:vapeless/helpers/my_extension.dart';
import 'package:vapeless/utils/app_colors.dart';
import 'package:vapeless/utils/app_string.dart';
import 'package:vapeless/view/component/button/common_button.dart';
import 'package:vapeless/view/component/text/common_text.dart';

class VapelessProfileScreen extends StatelessWidget {
  const VapelessProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonText(
          text: AppString.yourVapingProfile,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: GetBuilder<QuestionController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                    color: AppColors.bg4,
                    border: Border.all(color: AppColors.white, width: 0.5),
                    borderRadius: BorderRadius.circular(12)),
                child: const Column(
                  children: [
                    CommonText(
                      text: AppString.potentialYearlySaving,
                      top: 10,
                      color: AppColors.white,
                    ),
                    CommonText(
                      text: "\$1,825",
                      fontSize: 32,
                      top: 20,
                      color: AppColors.ok,
                    ),
                    CommonText(
                      text: "That’s \$5.00 saved per day!",
                      top: 10,
                      color: AppColors.nav,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    color: AppColors.bg4,
                    border: Border.all(color: AppColors.white, width: 0.5),
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Icon(
                          CupertinoIcons.battery_0,
                          color: AppColors.white,
                        ),
                        CommonText(
                          text: AppString.vapingDependencyLevel,
                          left: 10,
                        ),
                      ],
                    ),
                    10.height,
                    Row(
                      children: [
                        Expanded(
                          child: LinearProgressBar(
                            maxSteps: 7,
                            progressType: LinearProgressBar.progressTypeLinear,
                            // Use Linear progress
                            currentStep: 3,
                            progressColor: Colors.orange,
                            backgroundColor: Colors.grey,
                            borderRadius: BorderRadius.circular(10), //  NEW
                          ),
                        ),
                        const CommonText(
                          text: AppString.moderate,
                          left: 20,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    color: AppColors.bg4,
                    border: Border.all(color: AppColors.white, width: 0.5),
                    borderRadius: BorderRadius.circular(12)),
                child: const CommonText(
                  text: AppString.vapelessProfileDetails,
                  maxLines: 6,
                  color: AppColors.white,
                ),
              ),
              200.height,
              CommonButton(
                titleText: AppString.startMyQuittingJourney,
                onTap: () => Get.toNamed(AppRoutes.subscription),
              )
            ],
          ),
        ),
      ),
    );
  }
}
