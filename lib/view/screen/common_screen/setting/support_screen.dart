import 'package:flutter/material.dart';
import 'package:vapeless/helpers/my_extension.dart';
import 'package:vapeless/utils/app_colors.dart';
import 'package:vapeless/utils/app_string.dart';
import 'package:vapeless/view/component/text/common_text.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonText(
          text: AppString.support,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            CommonText(
              text: AppString.supportDetails,
              maxLines: 5,
              top: 50,
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 50),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: AppColors.inputBar,
                  borderRadius: BorderRadius.circular(12)),
              child: const Column(
                children: [
                  Icon(
                    Icons.mail_outline,
                    color: AppColors.white,
                  ),
                  CommonText(
                    text: AppString.chatWithUs,
                    fontSize: 18,
                  ),
                  Text(
                    "support@vapeless.io",
                    style: TextStyle(
                        color: AppColors.nav,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.nav),
                  ),
                ],
              ),
            ),
            const CommonText(
              text: AppString.vapeLess,
              fontSize: 32,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
              top: 280,
            ).center,
            const CommonText(
              text: AppString.breakFreeToday,
              fontSize: 12,
              top: 6,
              bottom: 40,
            ).center,
          ],
        ),
      ),
    );
  }
}
