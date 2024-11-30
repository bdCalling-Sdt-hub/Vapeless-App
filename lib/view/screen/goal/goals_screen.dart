import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vapeless/helpers/app_routes.dart';
import 'package:vapeless/helpers/my_extension.dart';
import 'package:vapeless/utils/app_string.dart';
import 'package:vapeless/view/component/text/common_text.dart';
import 'package:vapeless/view/screen/goal/widgets/item.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonText(
          text: AppString.goals,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          children: [
            GestureDetector(
                onTap: () => Get.toNamed(AppRoutes.groupGoalSet),
                child:
                    const Item(icon: Icons.group, title: AppString.groupGoals)),
            20.height,
            GestureDetector(
                onTap: () => Get.toNamed(AppRoutes.friendsAndProgress),
                child: const Item(
                    icon: Icons.language, title: AppString.friendsProgress)),
          ],
        ),
      ),
    );
  }
}
