import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vapeless/controllers/goal/set_goal_controller.dart';
import 'package:vapeless/helpers/my_extension.dart';
import 'package:vapeless/utils/app_colors.dart';
import 'package:vapeless/utils/app_string.dart';
import 'package:vapeless/view/component/button/common_button.dart';
import 'package:vapeless/view/component/text/common_text.dart';
import 'package:vapeless/view/component/text_field/common_text_field.dart';

class SetGoalScreen extends StatelessWidget {
  const SetGoalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            CommonText(
              text: AppString.setQuitDate,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            CommonText(
              text: AppString.vapeFreeLifeStartsToday,
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: AppColors.t2,
              top: 4,
            ),
          ],
        ),
      ),
      body: GetBuilder<SetGoalController>(
        builder: (controller) => SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              20.height,
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColors.bg4,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.white, width: 0.5)),
                child: Row(
                  children: [
                    const Icon(
                      Icons.date_range,
                      color: AppColors.ok,
                    ),
                    10.width,
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CommonText(
                            text: AppString.quitDateGoals,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            bottom: 4,
                          ),
                          CommonTextField(
                            hintText: "YYYY-MM-DD",
                            controller: controller.dateController,
                            paddingVertical: 8,
                            onTap: controller.selectDate,
                            keyboardType: TextInputType.none,
                            suffixIcon: GestureDetector(
                              onTap: controller.selectDate,
                              child: const Icon(
                                Icons.date_range,
                                color: AppColors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              50.height,
              const CommonText(
                text: AppString.yourGoal,
                fontSize: 18,
              ),
              16.height,
              CommonButton(
                titleText: "Quit by October 8, 2024",
                buttonWidth: 220,
                titleSize: 14,
                buttonRadius: 30,
                onTap: () {},
              ),
              50.height,
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: AppColors.bg4,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.white, width: 0.5)),
                child: const Column(
                  children: [
                    CommonText(
                      text: AppString.daysUntilYourQuitDate,
                      fontSize: 12,
                      color: AppColors.t2,
                    ),
                    CommonText(
                      text: "0",
                      fontSize: 24,
                      color: AppColors.p1,
                      top: 8,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    color: AppColors.bg4,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.white, width: 0.5)),
                child: const Column(
                  children: [
                    CommonText(
                      text: AppString.setGoalDetails,
                      fontSize: 12,
                      color: AppColors.t5,
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
              70.height,
              CommonButton(
                titleText: AppString.setGoal,
                onTap: () => Get.back(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
