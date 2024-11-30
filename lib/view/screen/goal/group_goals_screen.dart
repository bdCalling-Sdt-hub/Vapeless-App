import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vapeless/controllers/goal/group_goal_controller.dart';
import 'package:vapeless/helpers/app_routes.dart';
import 'package:vapeless/helpers/my_extension.dart';
import 'package:vapeless/utils/app_icons.dart';
import 'package:vapeless/utils/app_string.dart';
import 'package:vapeless/view/component/button/common_button.dart';
import 'package:vapeless/view/component/text/common_text.dart';
import 'package:vapeless/view/screen/goal/widgets/list_item.dart';

import '../../../utils/app_colors.dart';
import '../../component/image/common_image.dart';

class GroupGoalsScreen extends StatelessWidget {
  const GroupGoalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonText(
          text: AppString.groupGoals,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: GetBuilder<GroupGoalsController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(bottom: 14),
                decoration: BoxDecoration(
                    color: AppColors.bg4,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.white, width: 0.5)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonText(
                            text:
                                "${controller.groupGoalModel.data.isNotEmpty ? controller.groupGoalModel.data[0].groupDetails.duration : ""}-Days Challange"),
                        CommonText(
                            text:
                                "${controller.groupGoalModel.data.isNotEmpty ? controller.groupGoalModel.data[0].groupDetails.duration : ""}/1000"),
                      ],
                    ),
                    16.height,
                    LinearProgressIndicator(
                      value: 0.70,
                      color: AppColors.nav,
                      minHeight: 10,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    const CommonText(
                      text: "Together, limit your puffs to 1000 in 30 days",
                      fontSize: 10,
                      top: 10,
                    ).start,
                    const CommonText(
                      text: AppString.teamContribution,
                      top: 10,
                    ).start,
                    16.height,
                    ListView.builder(
                      itemCount: controller.groupGoalModel.data.isNotEmpty
                          ? controller
                              .groupGoalModel.data[0].participants.length
                          : 0,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => ListItem(
                        item: controller
                            .groupGoalModel.data[0].participants[index],
                        index: index + 1,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: AppColors.bg4,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.white, width: 0.5)),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.radio_button_on,
                          color: AppColors.nav,
                        ),
                        CommonText(
                          text: AppString.reward,
                          left: 4,
                        )
                      ],
                    ),
                    const CommonText(
                      text: AppString.rewardDetails,
                      maxLines: 3,
                      fontSize: 12,
                      textAlign: TextAlign.start,
                      top: 12,
                      bottom: 16,
                    ),
                    CommonImage(
                      imageSrc: AppIcons.award,
                      height: 50,
                      width: 50,
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(top: 16),
                decoration: BoxDecoration(
                    color: AppColors.bg4,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.white, width: 0.5)),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.radio_button_on,
                          color: AppColors.nav,
                        ),
                        CommonText(
                          text: AppString.groupGoalsSettings,
                          left: 4,
                        )
                      ],
                    ),
                    const CommonText(
                      text: "${AppString.challengeDuration}: 30 days",
                      maxLines: 3,
                      fontSize: 12,
                      textAlign: TextAlign.start,
                      top: 12,
                    ).start,
                    Slider(
                      value: controller.sliderValue,
                      min: 0,
                      max: 100,
                      activeColor: AppColors.primaryColor,
                      thumbColor: Colors.white,
                      // Number of steps in the slider
                      label: controller.sliderValue.round().toString(),
                      onChanged: controller.changeSliderValue,
                    ),
                    CommonButton(
                      buttonHeight: 28,
                      buttonWidth: 180,
                      titleText: AppString.setChallengeDuration,
                      buttonColor: AppColors.blueNormal,
                      titleSize: 12,
                      onTap: () => Get.toNamed(AppRoutes.setGoal),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
