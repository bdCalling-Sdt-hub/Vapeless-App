import 'package:flutter/material.dart';
import 'package:vapeless/helpers/app_routes.dart';
import '../../../../helpers/my_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/common_controller/setting/setting_controller.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_string.dart';
import '../../../component/bottom_nav_bar/common_bottom_bar.dart';
import '../../../component/other_widgets/item.dart';
import '../../../component/pop_up/common_pop_menu.dart';
import '../../../component/text/common_text.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CommonText(
          text: AppString.settings,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: GetBuilder<SettingController>(
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              children: [
                20.height,
                Item(
                  onTap: () => Get.toNamed(AppRoutes.changePassword),
                  title: AppString.changePassword,
                  icon: Icons.lock_outline,
                ),
                Item(
                  onTap: () => Get.toNamed(AppRoutes.privacyPolicy),
                  title: AppString.privacyPolicy,
                  icon: Icons.network_wifi_1_bar,
                ),
                Item(
                  onTap: () => Get.toNamed(AppRoutes.termsOfServices),
                  title: AppString.termsOfServices,
                  icon: Icons.gavel,
                ),
                20.height,
                GestureDetector(
                  onTap: () => deletePopUp(
                      controller: controller.passwordController,
                      onTap: controller.deleteAccountRepo,
                      isLoading: controller.isLoading),
                  child: Container(
                    height: 52.h,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                        color: AppColors.inputBar,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.delete_outline_rounded,
                          color: AppColors.white,
                        ),
                        CommonText(
                          text: AppString.deleteAccount,
                          color: AppColors.white,
                          left: 12.w,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const CommonBottomNavBar(
        currentIndex: 0,
      ),
    );
  }
}
