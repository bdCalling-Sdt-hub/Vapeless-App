import 'package:flutter/material.dart';
import '../../../../../helpers/my_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../controllers/common_controller/auth/sign_up_controller.dart';
import '../../../../../helpers/prefs_helper.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_string.dart';
import '../../../../component/button/common_button.dart';
import '../../../../component/text/common_text.dart';
import 'widget/already_accunt_rich_text.dart';
import 'widget/sign_up_all_filed.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: GetBuilder<SignUpController>(
          builder: (controller) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Form(
                key: formKey,
                child: Column(children: [
                  const CommonText(
                    text: AppString.welcome,
                    fontSize: 32,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CommonText(
                        text: AppString.signUp,
                        fontSize: 32,
                        bottom: 20,
                        color: AppColors.p1,
                      ),
                      6.width,
                      const CommonText(
                        text: AppString.toQuit,
                        fontSize: 32,
                        bottom: 20,
                      ),
                    ],
                  ),
                  const SignUpAllField(),
                  80.height,
                  CommonButton(
                    titleText: AppString.signUp,
                    isLoading: controller.isLoading,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        controller.signUpUser();
                        PrefsHelper.myRole = controller.selectRole;
                      }
                    },
                  ),
                  24.height,
                  const AlreadyAccountRichText()
                ]),
              ),
            );
          },
        ));
  }
}
