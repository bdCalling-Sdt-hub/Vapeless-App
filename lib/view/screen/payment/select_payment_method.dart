import 'package:flutter/material.dart';
import 'package:vapeless/helpers/my_extension.dart';
import 'package:vapeless/utils/app_colors.dart';
import 'package:vapeless/utils/app_icons.dart';
import 'package:vapeless/utils/app_images.dart';
import 'package:vapeless/utils/app_string.dart';
import 'package:vapeless/view/component/text/common_text.dart';

import '../../../controllers/payment/payment_controller.dart';
import '../../component/image/common_image.dart';

class SelectPaymentMethod extends StatelessWidget {
  const SelectPaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonText(
          text: AppString.payment,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const CommonText(
              text: AppString.selectPaymentMethod,
              color: AppColors.nav,
              fontSize: 20,
              top: 20,
            ),
            GestureDetector(
              onTap: () {
                PaymentController.instance.makePayment();
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                    color: AppColors.t7,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    CommonImage(
                      imageSrc: AppImages.stripe,
                      imageType: ImageType.png,
                    ),
                    8.width,
                    const CommonText(
                      text: "Stripe",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      PaymentController.instance.paymentPaypal(),
                ));
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    color: AppColors.t7,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    CommonImage(
                      imageSrc: AppIcons.paypal,
                      imageType: ImageType.svg,
                    ),
                    8.width,
                    const CommonText(
                      text: "Paypal",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
