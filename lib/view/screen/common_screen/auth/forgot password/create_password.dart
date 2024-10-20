import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vapeless/utils/app_colors.dart';
import '../../../../../controllers/common_controller/auth/forget_password_controller.dart';
import '../../../../../helpers/my_extension.dart';
import '../../../../../helpers/other_helper.dart';
import '../../../../../utils/app_string.dart';
import '../../../../component/button/common_button.dart';
import '../../../../component/text/common_text.dart';
import '../../../../component/text_field/common_text_field.dart';

class CreatePassword extends StatelessWidget {
  CreatePassword({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonText(
          text: AppString.resetPassword,
          fontWeight: FontWeight.w700,
          fontSize: 24,
        ),
      ),
      body: GetBuilder<ForgetPasswordController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  64.height,
                  const CommonText(
                    text: AppString.nowResetYour,
                    fontSize: 24,
                  ).center,
                  const CommonText(
                    text: AppString.password,
                    fontSize: 24,
                    color: AppColors.p1,
                    bottom: 70,
                  ).center,
                  const CommonText(
                    text: AppString.password,
                    bottom: 8,
                  ),
                  CommonTextField(
                    controller: controller.passwordController,
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: AppColors.t4,
                    ),
                    hintText: AppString.password,
                    isPassword: true,
                    validator: OtherHelper.passwordValidator,
                  ),
                  const CommonText(
                    text: AppString.confirmPassword,
                    bottom: 8,
                    top: 20,
                  ),
                  CommonTextField(
                    controller: controller.confirmPasswordController,
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: AppColors.t4,
                    ),
                    hintText: AppString.confirmPassword,
                    validator: (value) => OtherHelper.confirmPasswordValidator(
                        value, controller.passwordController),
                    isPassword: true,
                  ),
                  150.height,
                  CommonButton(
                    titleText: AppString.resetPassword,
                    isLoading: controller.isLoadingReset,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        controller.resetPasswordRepo();
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
