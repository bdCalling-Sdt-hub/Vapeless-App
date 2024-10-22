import 'package:flutter/material.dart';
import 'package:vapeless/utils/app_colors.dart';
import 'package:vapeless/view/component/text/common_text.dart';

class DashboardItem extends StatelessWidget {
  const DashboardItem(
      {super.key, required this.title, required this.icon, required this.time});

  final String title;
  final Widget icon;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: AppColors.bg4,
          border: Border.all(color: AppColors.white, width: 0.5),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          CommonText(text: title),
          CommonText(
            text: time,
            fontSize: 20,
            top: 8,
          ),
        ],
      ),
    );
  }
}
