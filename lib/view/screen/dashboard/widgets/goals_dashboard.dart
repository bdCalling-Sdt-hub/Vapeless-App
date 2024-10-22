import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:vapeless/helpers/my_extension.dart';
import 'package:vapeless/utils/app_string.dart';
import 'package:vapeless/view/component/text/common_text.dart';

import '../../../../utils/app_colors.dart';

class GoalsDashboard extends StatelessWidget {
  const GoalsDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppColors.bg4,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.white, width: 0.5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CommonText(
            text: AppString.goalsDashboard,
            bottom: 6,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: "${AppString.dailyLimit} 200",
                bottom: 6,
                fontSize: 12,
              ),
              CommonText(
                text: "90%",
                fontSize: 12,
              ),
            ],
          ),
          LinearProgressBar(
            maxSteps: 100,
            progressType: LinearProgressBar.progressTypeLinear,
            currentStep: 90,
            progressColor: AppColors.nav,
            backgroundColor: Colors.grey,
            borderRadius: BorderRadius.circular(10), //  NEW
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: AppString.nicotineGoals,
                top: 12,
                fontSize: 12,
                bottom: 8,
              ),
              CommonText(
                text: "70%",
                fontSize: 12,
                top: 12,
              ),
            ],
          ),
          LinearProgressBar(
            maxSteps: 100,
            progressType: LinearProgressBar.progressTypeLinear,
            // Use Linear progress
            currentStep: 70,
            progressColor: AppColors.p1,
            backgroundColor: Colors.grey,
            borderRadius: BorderRadius.circular(10), //  NEW
          ),
        ],
      ),
    );
  }
}
