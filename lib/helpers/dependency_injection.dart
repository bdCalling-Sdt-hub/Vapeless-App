import 'package:get/get.dart';
import 'package:vapeless/controllers/goal/goal_setting.dart';
import 'package:vapeless/controllers/goal/set_goal_controller.dart';
import 'package:vapeless/controllers/question_controller.dart';
import 'package:vapeless/controllers/subscription_controller.dart';

import '../controllers/breathing_controller.dart';
import '../controllers/common_controller/auth/change_password_controller.dart';
import '../controllers/common_controller/auth/forget_password_controller.dart';
import '../controllers/common_controller/auth/sign_in_controller.dart';
import '../controllers/common_controller/auth/sign_up_controller.dart';
import '../controllers/common_controller/message/chat_controller.dart';
import '../controllers/common_controller/message/message_controller.dart';
import '../controllers/common_controller/notifications/notifications_controller.dart';
import '../controllers/common_controller/profile/profile_controller.dart';
import '../controllers/common_controller/setting/privacy_policy_controller.dart';
import '../controllers/common_controller/setting/setting_controller.dart';
import '../controllers/common_controller/setting/terms_of_services_controller.dart';
import '../controllers/dashboard/dashboard_controller.dart';
import '../controllers/goal/friends_and_progress_controller.dart';
import '../controllers/goal/group_goal_controller.dart';
import '../controllers/recovery_controller.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController(), fenix: true);
    Get.lazyPut(() => SignInController(), fenix: true);
    Get.lazyPut(() => ForgetPasswordController(), fenix: true);
    Get.lazyPut(() => ChangePasswordController(), fenix: true);
    Get.lazyPut(() => NotificationsController(), fenix: true);
    Get.lazyPut(() => ChatController(), fenix: true);
    Get.lazyPut(() => MessageController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => SettingController(), fenix: true);
    Get.lazyPut(() => PrivacyPolicyController(), fenix: true);
    Get.lazyPut(() => TermsOfServicesController(), fenix: true);
    Get.lazyPut(() => QuestionController(), fenix: true);
    Get.lazyPut(() => SubscriptionController(), fenix: true);
    Get.lazyPut(() => DashboardController(), fenix: true);
    Get.lazyPut(() => GoalSettingController(), fenix: true);
    Get.lazyPut(() => SetGoalController(), fenix: true);
    Get.lazyPut(() => RecoveryController(), fenix: true);
    Get.lazyPut(() => GroupGoalsController(), fenix: true);
    Get.lazyPut(() => FriendsAndProgressController(), fenix: true);
    Get.lazyPut(() => BreathingController(), fenix: true);
  }
}
