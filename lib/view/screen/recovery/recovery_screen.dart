import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vapeless/controllers/recovery_controller.dart';
import 'package:vapeless/helpers/my_extension.dart';
import 'package:vapeless/utils/app_string.dart';
import 'package:vapeless/view/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:vapeless/view/component/text/common_text.dart';

import '../../../utils/app_colors.dart';
import 'widgets/list_item.dart';

class RecoveryScreen extends StatefulWidget {
  RecoveryScreen({super.key});

  @override
  State<RecoveryScreen> createState() => _RecoveryScreenState();
}

class _RecoveryScreenState extends State<RecoveryScreen> {
  double _sliderValue = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<RecoveryController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            children: [
              50.height,
              const CommonText(
                text: AppString.yourPathToBeingVapeFree,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              16.height,
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                    text: AppString.healingProgress,
                  ),
                  CommonText(
                    text: "17 days",
                  ),
                ],
              ),
              Slider(
                value: _sliderValue,
                min: 0,
                max: 100,
                activeColor: AppColors.primaryColor,
                thumbColor: Colors.transparent,
                // Number of steps in the slider
                label: _sliderValue.round().toString(),
                onChanged: (double value) {
                  // setState(() {
                  //   _sliderValue = value;
                  // });
                },
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: controller.list.length,
                  itemBuilder: (context, index) => ListItem(
                    item: controller.list[index],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CommonBottomNavBar(currentIndex: 1),
    );
  }
}
