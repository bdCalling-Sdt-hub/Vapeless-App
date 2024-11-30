import 'package:flutter/material.dart';
import 'package:vapeless/helpers/prefs_helper.dart';
import 'package:vapeless/utils/app_colors.dart';
import 'package:vapeless/utils/app_icons.dart';
import 'package:vapeless/utils/app_images.dart';
import 'package:vapeless/utils/app_string.dart';
import 'package:vapeless/view/component/image/common_image.dart';
import 'package:vapeless/view/component/text/common_text.dart';

import '../../../../models/group_goal_model.dart';

class AddFriend extends StatelessWidget {
  const AddFriend({super.key, required this.item, required this.index});

  final Participant item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          CommonText(
            text: index.toString(),
            right: 12,
            color: index == 1 || index == 2 || index == 3
                ? AppColors.yellow
                : AppColors.white,
          ),
          CircleAvatar(
            radius: 11,
            child: CommonImage(
              imageSrc: item.image,
              imageType: ImageType.network,
            ),
          ),
          CommonText(
            text: item.userId,
            left: 8,
            color: item.userId == PrefsHelper.userId
                ? AppColors.nav
                : AppColors.white,
          ),
          const Spacer(),
          const Row(
            children: [
              Icon(
                Icons.add,
                color: AppColors.ok,
              ),
              CommonText(
                text: AppString.addFriends,
                color: AppColors.ok,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              )
            ],
          )
        ],
      ),
    );
  }
}
