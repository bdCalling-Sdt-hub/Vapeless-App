import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vapeless/helpers/my_extension.dart';
import 'package:vapeless/utils/app_colors.dart';
import '../../../../controllers/common_controller/profile/profile_controller.dart';
import '../../../../helpers/app_routes.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_string.dart';
import '../../../component/bottom_nav_bar/common_bottom_bar.dart';
import '../../../component/image/common_image.dart';
import '../../../component/other_widgets/item.dart';
import '../../../component/pop_up/common_pop_menu.dart';
import '../../../component/text/common_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CommonText(
          text: AppString.profile,
          fontWeight: FontWeight.w600,
          fontSize: 24,
        ),
      ),
      body: GetBuilder<ProfileController>(
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Column(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 60.sp,
                    backgroundColor: Colors.transparent,
                    child: ClipOval(
                      child: CommonImage(
                        imageSrc: AppImages.profile,
                        imageType: ImageType.png,
                        height: 120,
                        width: 120,
                        defaultImage: AppImages.profile,
                      ),
                    ),
                  ),
                ),
                const CommonText(
                  text: "Naimul Hassan",
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  bottom: 24,
                ),
                Item(
                  icon: Icons.person,
                  title: AppString.editProfile,
                  onTap: () => Get.toNamed(AppRoutes.editProfile),
                ),
                Item(
                  icon: Icons.group,
                  title: AppString.goals,
                  onTap: () => Get.toNamed(AppRoutes.goalsScreen),
                ),
                Item(
                  icon: Icons.headset_mic_rounded,
                  title: AppString.support,
                  onTap: () => Get.toNamed(AppRoutes.supportScreen),
                ),
                Item(
                  icon: Icons.settings,
                  title: AppString.settings,
                  onTap: () => Get.toNamed(AppRoutes.setting),
                ),
                50.height,
                Item(
                  icon: Icons.logout,
                  title: AppString.logOut,
                  onTap: () => Get.toNamed(AppRoutes.setting),
                  bgColor: AppColors.bg4 ,
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const CommonBottomNavBar(
        currentIndex: 3,
      ),
    );
  }
}
