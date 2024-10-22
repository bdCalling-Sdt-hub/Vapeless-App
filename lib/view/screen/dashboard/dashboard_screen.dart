import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vapeless/helpers/my_extension.dart';
import 'package:vapeless/utils/app_colors.dart';
import 'package:vapeless/utils/app_icons.dart';
import 'package:vapeless/utils/app_string.dart';
import 'package:vapeless/view/component/image/common_image.dart';
import 'package:vapeless/view/component/text/common_text.dart';
import 'package:vapeless/view/screen/dashboard/widgets/dashboard_item.dart';
import 'package:vapeless/view/screen/dashboard/widgets/glowing_icon.dart';

import '../../component/bottom_nav_bar/common_bottom_bar.dart';
import 'widgets/goals_dashboard.dart';
import 'widgets/puffs_resiue.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            CommonText(
              text: AppString.vapeLess,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
            CommonText(
              text: AppString.breakFreeToday,
              top: 6,
            ),
          ],
        ),
        actions: const [
          GlowingIcon(icon: Icons.access_time),
          SizedBox(width: 20),
          GlowingIcon(icon: Icons.settings),
          SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              height: 180.h,
              width: 180.h,
              margin: const EdgeInsets.only(top: 20),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.dropShadow, // Glow color
                    blurRadius: 10,
                    spreadRadius: 3,
                  ),
                ],
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CommonText(
                    text: AppString.tapToCount,
                    color: AppColors.p1,
                    top: 20,
                  ),
                  CommonText(
                    text: "30",
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                  CommonText(
                    text: AppString.puffsToday,
                    color: AppColors.p1,
                  )
                ],
              ),
            ).center,
            24.height,
            Row(
              children: [
                Expanded(
                  child: DashboardItem(
                      title: "Daily Avg",
                      icon: CommonImage(
                        imageSrc: AppIcons.dailyAve,
                        height: 30,
                        width: 30,
                      ),
                      time: " 0"),
                ),
                10.width,
                Expanded(
                  child: DashboardItem(
                      title: "Streak",
                      icon: CommonImage(
                        imageSrc: AppIcons.streak,
                        height: 30,
                        width: 30,
                      ),
                      time: " 0d"),
                ),
                10.width,
                Expanded(
                  child: DashboardItem(
                      title: "Gap",
                      icon: CommonImage(
                        imageSrc: AppIcons.gap,
                        height: 30,
                        width: 30,
                      ),
                      time: "0m"),
                ),
              ],
            ),
            20.height,
            const SizedBox(
              height: 200,
              child: PuffsResiue(),
            ),
            20.height,
            const GoalsDashboard(),
            20.height,
          ],
        ),
      ),
      bottomNavigationBar: const CommonBottomNavBar(
        currentIndex: 0,
      ),
    );
  }
}
