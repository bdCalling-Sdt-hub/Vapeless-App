import 'package:flutter/material.dart';
import '../../../../helpers/my_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../helpers/app_routes.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_string.dart';
import '../../../component/button/common_button.dart';
import '../../../component/image/common_image.dart';
import '../../../component/text/common_text.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          children: [
            180.height,
            const Center(
                child: CommonText(
              text: AppString.vapeLess,
              fontSize: 56,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            )),
            const Center(
                child: CommonText(
              text: AppString.yourJourneyFreedoom,
            )),
            160.height,
            CommonButton(
              titleText: AppString.signInWithPassword,
              onTap: () => Get.toNamed(AppRoutes.signIn),
            ),
            24.height,
            CommonButton(
              titleText: AppString.signUp,
              buttonColor: AppColors.transparent,
              onTap: () => Get.toNamed(AppRoutes.signUp),
            ),
          ],
        ),
      ),
    );
  }
}
