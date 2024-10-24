import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../../../helpers/my_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../controllers/common_controller/profile/profile_controller.dart';
import '../../../../../helpers/other_helper.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_string.dart';
import '../../../../component/pop_up/common_pop_menu.dart';
import '../../../../component/text/common_text.dart';
import '../../../../component/text_field/common_phone_number_text_filed.dart';
import '../../../../component/text_field/common_text_field.dart';

class EditProfileAllFiled extends StatelessWidget {
  const EditProfileAllFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
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
              text: AppString.phoneNumber,
              bottom: 8,
              top: 12,
            ),
            CommonTextField(
              controller: controller.numberController,
              prefixIcon: const Icon(Icons.mail, color: AppColors.t4),
              hintText: AppString.email,
              validator: OtherHelper.emailValidator,
            ),
            const CommonText(
              text: AppString.country,
              bottom: 8,
              top: 12,
            ),
            CommonTextField(
              controller: controller.countryController,
              prefixIcon: const Icon(Icons.mail, color: AppColors.t4),
              hintText: AppString.email,
              validator: OtherHelper.emailValidator,
            ),
          ],
        );
        ;
      },
    );
  }
}
