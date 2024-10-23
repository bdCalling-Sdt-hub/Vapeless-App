import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vapeless/controllers/goal/goal_setting.dart';
import 'package:vapeless/helpers/my_extension.dart';
import 'package:vapeless/utils/app_colors.dart';
import 'package:vapeless/utils/app_icons.dart';
import 'package:vapeless/utils/app_string.dart';
import 'package:vapeless/view/component/button/common_button.dart';
import 'package:vapeless/view/component/image/common_image.dart';
import 'package:vapeless/view/component/text/common_text.dart';

class GoalSetting extends StatefulWidget {
  GoalSetting({super.key});

  @override
  State<GoalSetting> createState() => _GoalSettingState();
}

class _GoalSettingState extends State<GoalSetting> {
  double _sliderValue = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            CommonText(
              text: AppString.settings,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            CommonText(
              text: AppString.customizeYourLimits,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.t2,
              top: 4,
            ),
          ],
        ),
      ),
      body: GetBuilder<GoalSettingController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              50.height,
              Container(
                decoration: BoxDecoration(
                    color: AppColors.bg4,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.white, width: 0.5)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            10.width,
                            CommonImage(
                              imageSrc: AppIcons.dailyLimit,
                              imageType: ImageType.svg,
                            ),
                            const CommonText(
                              text: AppString.dailyLimit,
                              left: 4,
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(6),
                          margin: const EdgeInsets.only(top: 10, right: 10),
                          decoration: BoxDecoration(
                              color: AppColors.t7,
                              borderRadius: BorderRadius.circular(12)),
                          child: const CommonText(text: "200 puffs"),
                        )
                      ],
                    ),
                    Slider(
                      value: _sliderValue,
                      min: 0,
                      max: 100,
                      activeColor: AppColors.primaryColor,
                      thumbColor: Colors.white,
                      // Number of steps in the slider
                      label: _sliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _sliderValue = value;
                        });
                      },
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        8.width,
                        const Icon(
                          Icons.info_outline,
                          color: AppColors.t2,
                          size: 20,
                        ),
                        const Expanded(
                          child: CommonText(
                            text: AppString.dailyLimitsDetails,
                            maxLines: 4,
                            color: AppColors.t2,
                            textAlign: TextAlign.start,
                            bottom: 10,
                            right: 10,
                            left: 4,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                decoration: BoxDecoration(
                    color: AppColors.bg4,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.white, width: 0.5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    10.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            10.width,
                            CommonImage(
                              imageSrc: AppIcons.nicotineStrength,
                              imageType: ImageType.svg,
                            ),
                            const CommonText(
                              text: AppString.nicotineStrength,
                              left: 4,
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              color: AppColors.t7,
                              borderRadius: BorderRadius.circular(12)),
                          child: const CommonText(
                            text: "50%",
                            fontSize: 10,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(6),
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              color: AppColors.t7,
                              borderRadius: BorderRadius.circular(12)),
                          child: const CommonText(
                            text: "25.0mg/ml puffs",
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      value: _sliderValue,
                      min: 0,
                      max: 100,
                      activeColor: AppColors.primaryColor,
                      thumbColor: Colors.white,
                      // Number of steps in the slider
                      label: _sliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _sliderValue = value;
                        });
                      },
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        8.width,
                        const Icon(
                          Icons.info_outline,
                          color: AppColors.t2,
                          size: 20,
                        ),
                        const Expanded(
                          child: CommonText(
                            text: AppString.nicotineStrengthDetails,
                            maxLines: 4,
                            color: AppColors.t2,
                            textAlign: TextAlign.start,
                            bottom: 10,
                            right: 10,
                            left: 4,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                decoration: BoxDecoration(
                    color: AppColors.bg4,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.white, width: 0.5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    10.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            10.width,
                            const Icon(
                              CupertinoIcons.battery_0,
                              color: AppColors.ok,
                            ),
                            const CommonText(
                              text: AppString.deviceSettings,
                              left: 4,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const CommonText(
                      text: "Device Capacity (ml)",
                      left: 10,
                      color: AppColors.t2,
                      top: 10,
                    ).start,
                    SizedBox(
                      height: 34,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.capacityList.length,
                        itemBuilder: (context, index) => Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          margin: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: AppColors.bg2,
                              borderRadius: BorderRadius.circular(8)),
                          child:
                              CommonText(text: controller.capacityList[index]),
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        8.width,
                        const Icon(
                          Icons.info_outline,
                          color: AppColors.t2,
                          size: 20,
                        ),
                        const Expanded(
                          child: CommonText(
                            text: AppString.deviceSettingsDetails,
                            maxLines: 4,
                            color: AppColors.t2,
                            textAlign: TextAlign.start,
                            bottom: 10,
                            right: 10,
                            left: 4,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              50.height,
              CommonButton(
                titleText: AppString.saveAndChanges,
                onTap: () => Get.back(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
