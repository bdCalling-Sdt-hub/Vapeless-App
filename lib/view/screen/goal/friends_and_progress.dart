import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vapeless/controllers/goal/friends_and_progress_controller.dart';
import 'package:vapeless/helpers/my_extension.dart';
import 'package:vapeless/utils/app_string.dart';
import 'package:vapeless/view/component/text/common_text.dart';
import 'package:vapeless/view/component/text_field/common_text_field.dart';

import '../../../utils/app_colors.dart';
import 'widgets/list_item.dart';

class FriendsAndProgress extends StatelessWidget {
  const FriendsAndProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonText(
          text: AppString.friendsProgress,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: GetBuilder<FriendsAndProgressController>(
        builder: (controller) => SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColors.bg4,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.white, width: 0.5)),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.person_add_alt,
                          color: AppColors.nav,
                        ),
                        CommonText(text: AppString.addFriends),
                      ],
                    ),
                    10.height,
                    CommonTextField(
                      fillColor: AppColors.t7,
                      hintText: AppString.searchByNameOrEmail,
                      suffixIcon: const Icon(
                        Icons.search,
                        color: AppColors.white,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColors.bg4,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.white, width: 0.5)),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.group,
                          color: AppColors.nav,
                        ),
                        CommonText(
                          text: AppString.yourFriends,
                          left: 8,
                        ),
                      ],
                    ),
                    10.height,
                    ListView.builder(
                      itemCount: controller.teamList.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => ListItem(
                        item: controller.teamList[index],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 16),
                decoration: BoxDecoration(
                    color: AppColors.bg4,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.white, width: 0.5)),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.emoji_events_outlined,
                          color: AppColors.nav,
                        ),
                        CommonText(
                          text: AppString.globalLeaderboard,
                          left: 8,
                        ),
                      ],
                    ),
                    10.height,
                    ListView.builder(
                      itemCount: controller.globalList.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => ListItem(
                        item: controller.globalList[index],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
