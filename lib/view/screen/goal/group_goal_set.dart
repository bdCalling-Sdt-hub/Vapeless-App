import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vapeless/helpers/my_extension.dart';
import 'package:vapeless/helpers/prefs_helper.dart';
import 'package:vapeless/models/group_goal_model.dart';
import 'package:vapeless/view/screen/goal/widgets/add_friend.dart';
import 'package:vapeless/view/screen/goal/widgets/list_item.dart';

import '../../../controllers/goal/group_goal_controller.dart';
import '../../../helpers/app_routes.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../../../utils/app_string.dart';
import '../../component/button/common_button.dart';
import '../../component/image/common_image.dart';
import '../../component/text/common_text.dart';
import '../../component/text_field/common_text_field.dart';

class GroupGoalSet extends StatelessWidget {
  const GroupGoalSet({super.key});

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
                decoration: BoxDecoration(
                    color: AppColors.bg4,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.white, width: 0.5)),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.groups,
                          color: AppColors.nav,
                        ),
                        CommonText(
                          text: AppString.addGroup,
                          left: 12,
                        ),
                      ],
                    ),
                    10.height,
                    CommonTextField(
                      fillColor: AppColors.t7,
                      hintText: AppString.searchByNameOrEmail,
                      suffixIcon: const Icon(
                        Icons.search,
                        color: AppColors.white,
                      ),
                    )
                  ],
                ),
              ),
              10.height,
              ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: controller.groupGoalModel.data.isNotEmpty
                    ? controller.groupGoalModel.data[0].participants.length
                    : 0,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => AddFriend(
                  item: Participant(
                      userId: "Naimul",
                      image: PrefsHelper.myImage,
                      vapeCount: 5),
                  index: index,
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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonText(
                          text: "1 week",
                          fontSize: 12,
                          color: AppColors.t2,
                        ),
                        CommonText(
                          text: "3 months",
                          color: AppColors.t2,
                          fontSize: 12,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(top: 20),
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
              20.height,
              const CommonButton(titleText: AppString.setGroupGoal)
            ],
          ),
        ),
      ),
    );
  }
}
