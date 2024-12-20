import 'package:get/get.dart';
import 'package:vapeless/view/screen/breathing_screen.dart';
import 'package:vapeless/view/screen/common_screen/setting/support_screen.dart';
import 'package:vapeless/view/screen/dashboard/dashboard_screen.dart';
import 'package:vapeless/view/screen/goal/friends_and_progress.dart';
import 'package:vapeless/view/screen/goal/goal_setting.dart';
import 'package:vapeless/view/screen/goal/goals_screen.dart';
import 'package:vapeless/view/screen/goal/group_goal_set.dart';
import 'package:vapeless/view/screen/goal/group_goals_screen.dart';
import 'package:vapeless/view/screen/goal/set_goal_screen.dart';
import 'package:vapeless/view/screen/payment/select_payment_method.dart';
import 'package:vapeless/view/screen/question/first_question_screen.dart';
import 'package:vapeless/view/screen/question/vapeless_profile_screen.dart';
import 'package:vapeless/view/screen/recovery/recovery_screen.dart';

import '../view/screen/common_screen/auth/change_password/change_password_screen.dart';
import '../view/screen/common_screen/auth/forgot password/create_password.dart';
import '../view/screen/common_screen/auth/forgot password/forgot_password.dart';
import '../view/screen/common_screen/auth/forgot password/verify_screen.dart';
import '../view/screen/common_screen/auth/sign in/sign_in_screen.dart';
import '../view/screen/common_screen/auth/sign up/sign_up_screen.dart';
import '../view/screen/common_screen/auth/sign up/verify_user.dart';
import '../view/screen/common_screen/message/chat_screen.dart';
import '../view/screen/common_screen/message/message_screen.dart';
import '../view/screen/common_screen/notifications/notifications_screen.dart';
import '../view/screen/common_screen/onboarding_screen/onboarding_screen.dart';
import '../view/screen/common_screen/profile/edit_profile.dart';
import '../view/screen/common_screen/profile/profile_screen.dart';
import '../view/screen/common_screen/setting/privacy_policy_screen.dart';
import '../view/screen/common_screen/setting/setting_screen.dart';
import '../view/screen/common_screen/setting/terms_of_services_screen.dart';
import '../view/screen/common_screen/splash/splash_screen.dart';
import '../view/screen/subscription/subscription_screen.dart';
import '../view/screen/test_screen.dart';

class AppRoutes {
  static const String test = "/test_screen.dart";
  static const String splash = "/splash_screen.dart";
  static const String onboarding = "/onboarding_screen.dart";
  static const String signUp = "/sign_up_screen.dart";
  static const String verifyUser = "/verify_user.dart";
  static const String signIn = "/sign_in_screen.dart";
  static const String forgotPassword = "/forgot_password.dart";
  static const String verifyEmail = "/verify_screen.dart";
  static const String createPassword = "/create_password.dart";
  static const String changePassword = "/change_password_screen.dart";
  static const String notifications = "/notifications_screen.dart";
  static const String chat = "/chat_screen.dart";
  static const String message = "/message_screen.dart";
  static const String profile = "/profile_screen.dart";
  static const String editProfile = "/edit_profile.dart";
  static const String privacyPolicy = "/privacy_policy_screen.dart";
  static const String termsOfServices = "/terms_of_services_screen.dart";
  static const String setting = "/setting_screen.dart";
  static const String firstQuestion = "/first_question_screen.dart";
  static const String vapelessProfile = "/vapeless_profile_screen.dart";
  static const String subscription = "/subscription_screen.dart";
  static const String selectPaymentMethod = "/select_payment_method.dart";
  static const String dashboard = "/dashboard_screen.dart";
  static const String goalSetting = "/goal_setting.dart";
  static const String setGoal = "/set_goal_screen.dart";
  static const String recovery = "/recovery_screen.dart";
  static const String goalsScreen = "/goals_screen.dart";
  static const String groupGoalsScreen = "/group_goals_screen.dart";
  static const String friendsAndProgress = "/friends_and_progress.dart";
  static const String supportScreen = "/support_screen.dart";
  static const String breathingScreen = "/breathing_screen.dart";
  static const String groupGoalSet = "/group_goal_set.dart";

  static List<GetPage> routes = [
    GetPage(
        name: test,
        page: () => TestScreen(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: splash,
        page: () => SplashScreen(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: onboarding,
        page: () => OnboardingScreen(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: signUp,
        page: () => SignUpScreen(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: verifyUser,
        page: () => VerifyUser(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: signIn,
        page: () => SignInScreen(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: forgotPassword,
        page: () => ForgotPasswordScreen(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: verifyEmail,
        page: () => VerifyScreen(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: createPassword,
        page: () => CreatePassword(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: changePassword,
        page: () => ChangePasswordScreen(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: notifications,
        page: () => NotificationScreen(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: chat,
        page: () => ChatListScreen(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: message,
        page: () => MessageScreen(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: profile,
        page: () => ProfileScreen(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: editProfile,
        page: () => EditProfile(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: privacyPolicy,
        page: () => PrivacyPolicyScreen(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: termsOfServices,
        page: () => TermsOfServicesScreen(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: setting,
        page: () => SettingScreen(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: firstQuestion,
        page: () => FirstQuestionScreen(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: vapelessProfile,
        page: () => VapelessProfileScreen(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: subscription,
        page: () => SubscriptionScreen(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: selectPaymentMethod,
        page: () => SelectPaymentMethod(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: dashboard,
        page: () => DashboardScreen(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: goalSetting,
        page: () => GoalSetting(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: setGoal,
        page: () => SetGoalScreen(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: recovery,
        page: () => RecoveryScreen(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: goalsScreen,
        page: () => GoalsScreen(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: groupGoalsScreen,
        page: () => GroupGoalsScreen(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: friendsAndProgress,
        page: () => FriendsAndProgress(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: supportScreen,
        page: () => SupportScreen(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: breathingScreen,
        page: () => BreathingScreen(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: groupGoalSet,
        page: () => GroupGoalSet(),
        transition: Transition.rightToLeftWithFade),
  ];
}
