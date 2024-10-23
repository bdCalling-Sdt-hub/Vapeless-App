import 'package:flutter/material.dart';
import 'package:vapeless/utils/app_colors.dart';
import 'package:vapeless/utils/app_icons.dart';
import 'package:vapeless/utils/app_images.dart';
import 'package:vapeless/utils/app_string.dart';
import 'package:vapeless/view/component/image/common_image.dart';
import 'package:vapeless/view/component/text/common_text.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.item});

  final Map item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          CommonText(
            text: item['rank'].toString(),
            right: 12,
            color: item['rank'] == 1 || item['rank'] == 2 || item['rank'] == 3
                ? AppColors.yellow
                : AppColors.white,
          ),
          CircleAvatar(
            radius: 11,
            child: CommonImage(
              imageSrc: item['image'],
              imageType: ImageType.png,
            ),
          ),
          CommonText(
            text: item['name'],
            left: 8,
            color: item['name'] == 'you' ? AppColors.nav : AppColors.white,
          ),
          const Spacer(),
          CommonImage(
            imageSrc: AppIcons.dailyAve,
            imageType: ImageType.svg,
            imageColor: AppColors.ok,
          ),
          CommonText(
            text: item['point'],
            color: AppColors.ok,
            left: 8,
          )
        ],
      ),
    );
  }
}
