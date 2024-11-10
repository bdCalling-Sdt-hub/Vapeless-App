import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:vapeless/helpers/app_routes.dart';
import 'package:vapeless/helpers/my_extension.dart';
import 'package:vapeless/utils/app_colors.dart';
import 'package:vapeless/utils/app_string.dart';
import 'package:vapeless/view/component/button/common_button.dart';
import 'package:vapeless/view/component/text/common_text.dart';
import 'package:vapeless/view/screen/subscription/widgets/supcription_item.dart';

import '../../../../models/subscription_model.dart';

class FreeSubscription extends StatelessWidget {
  const FreeSubscription({super.key, required this.subscriptionModel});

  final SubscriptionModel subscriptionModel ;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: AppColors.bg1,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.t4, width: 0.5)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CommonText(
              text: AppString.unlockYourVapeFreePotential,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              maxLines: 2,
            ),
            const CommonText(
              text: AppString.startYourJourneyToVapeFreeLifeToday,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              maxLines: 2,
            ),
            32.height,
            Container(
              height: 48,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryColor),
                  color: AppColors.t7,
                  borderRadius: BorderRadius.circular(12)),
              child: const Center(
                  child: CommonText(
                    maxLines: 2,
                text: "Try VapeLess Premium Free \nfor 30 Puffs",
                color: AppColors.nav,
              )),
            ),
            30.height,
            subscriptionItem("Personalized plan to quit vaping"),
            subscriptionItem("Track your progress toward quitting"),
            subscriptionItem("Breathing exercises to keep calm"),
            subscriptionItem("Community Support with friends"),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: 16, bottom: 16),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.bg4,
                  borderRadius: BorderRadius.circular(12.0)),
              child: Column(
                children: [
                  RatingBarIndicator(
                    rating: 5,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 30.0,
                    direction: Axis.horizontal,
                  ),
                  const CommonText(
                    text: AppString.reviewDetails,
                    maxLines: 3,
                    top: 10,
                    fontSize: 12,
                  ),
                  const CommonText(
                    text: "-Sarah Mahmud",
                    maxLines: 3,
                    fontSize: 14,
                    top: 10,
                    color: AppColors.nav,
                  )
                ],
              ),
            ),
            CommonButton(
              titleText: AppString.startYourFreeTrialNow,
              onTap: () => Get.toNamed(AppRoutes.dashboard),
            ),
            const CommonText(
              maxLines: 3,
              text: AppString.trialDetails,
              fontSize: 12,
              top: 12,
            )
          ],
        ),
      ),
    );
  }
}
