import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vapeless/controllers/question_controller.dart';
import 'package:vapeless/helpers/my_extension.dart';
import 'package:vapeless/view/component/button/common_button.dart';
import 'package:vapeless/view/component/text_field/common_text_field.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_string.dart';
import '../../component/text/common_text.dart';

class FirstQuestionScreen extends StatelessWidget {
  const FirstQuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<QuestionController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              150.height,
              const CommonText(
                text: AppString.vapeLess,
                fontSize: 32,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ).center,
              const CommonText(
                text: AppString.breakFreeToday,
                fontSize: 12,
                top: 6,
                bottom: 40,
              ).center,
              SizedBox(
                height: 16,
                child: ListView.builder(
                  itemCount: controller.questionList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == controller.index
                          ? AppColors.nav
                          : AppColors.t2,
                    ),
                    margin: const EdgeInsets.all(4),
                    height: 8,
                    width: 8,
                  ),
                ),
              ),
              CommonText(
                text: controller.questionList[controller.index],
                fontSize: 20,
                fontWeight: FontWeight.bold,
                maxLines: 3,
                top: 40,
                bottom: 40,
              ).center,
              Row(
                children: [
                  Expanded(
                    child: CommonTextField(
                      hintText: "0",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  if (controller.index == 1)
                    Container(
                      width: 60,
                      height: 48,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: AppColors.t7,
                          borderRadius: BorderRadius.circular(12)),
                      child: const CommonText(
                        text: "\$",
                        fontSize: 28,
                      ).center,
                    )
                ],
              ),
              50.height,
              if (controller.index < 3)
                CommonButton(
                  titleText: AppString.next,
                  onTap: controller.nextQuestion,
                ),
              if (controller.index >= 3)
                Row(
                  children: [
                    Expanded(
                        child: CommonButton(
                      titleText: AppString.no,
                      buttonColor: AppColors.t7,
                      borderColor: AppColors.t7,
                      onTap: controller.nextQuestion,
                    )),
                    16.width,
                    Expanded(
                        child: CommonButton(
                      titleText: AppString.yes,
                      borderColor: AppColors.inputBar,
                      buttonColor: AppColors.inputBar,
                      onTap: controller.nextQuestion,
                    ))
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
