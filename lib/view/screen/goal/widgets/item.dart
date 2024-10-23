import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vapeless/utils/app_colors.dart';
import 'package:vapeless/view/component/text/common_text.dart';

class Item extends StatelessWidget {
  const Item({super.key, required this.icon, required this.title});

  final IconData icon;

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: AppColors.inputBar, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.white,
          ),
          CommonText(
            text: title,
            left: 16,
          ),
          Spacer(),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColors.white,
          )
        ],
      ),
    );
  }
}
