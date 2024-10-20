import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../controllers/common_controller/auth/sign_up_controller.dart';
import '../../../../../../helpers/other_helper.dart';
import '../../../../../../utils/app_colors.dart';
import '../../../../../../utils/app_string.dart';
import '../../../../../component/text/common_text.dart';
import '../../../../../component/text_field/common_phone_number_text_filed.dart';
import '../../../../../component/text_field/common_text_field.dart';

class SignUpAllField extends StatefulWidget {
  const SignUpAllField({super.key});

  @override
  State<SignUpAllField> createState() => _SignUpAllFieldState();
}

class _SignUpAllFieldState extends State<SignUpAllField> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CommonText(
              text: AppString.fullName,
              bottom: 8,
              top: 12,
            ),
            CommonTextField(
              prefixIcon: const Icon(
                Icons.person,
                color: AppColors.t4,
              ),
              hintText: AppString.fullName,
              controller: controller.nameController,
              validator: OtherHelper.validator,
            ),
            const CommonText(
              text: AppString.email,
              bottom: 8,
              top: 12,
            ),
            CommonTextField(
              controller: controller.emailController,
              prefixIcon: const Icon(Icons.mail, color: AppColors.t4),
              hintText: AppString.email,
              validator: OtherHelper.emailValidator,
            ),
            const CommonText(
              text: AppString.password,
              bottom: 8,
              top: 12,
            ),
            CommonTextField(
              controller: controller.passwordController,
              prefixIcon: const Icon(Icons.lock, color: AppColors.t4),
              isPassword: true,
              hintText: AppString.password,
              validator: OtherHelper.passwordValidator,
            ),
            const CommonText(
              text: AppString.confirmPassword,
              bottom: 8,
              top: 12,
            ),
            CommonTextField(
              controller: controller.confirmPasswordController,
              prefixIcon: const Icon(Icons.lock, color: AppColors.t4),
              isPassword: true,
              hintText: AppString.confirmPassword,
              validator: (value) => OtherHelper.confirmPasswordValidator(
                  value, controller.passwordController),
            ),
          ],
        );
      },
    );
  }
}
