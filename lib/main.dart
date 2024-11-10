import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:vapeless/services/api_service.dart';
import 'package:vapeless/utils/app_url.dart';
import 'package:vapeless/utils/payment_key.dart';
import 'helpers/app_routes.dart';
import 'helpers/dependency_injection.dart';
import 'helpers/prefs_helper.dart';
import 'languages/language.dart';
import 'services/notification_service.dart';
import 'services/socket_service.dart';
import 'theme/light_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DependencyInjection dI = DependencyInjection();
  dI.dependencies();
  await PrefsHelper.getAllPrefData();
  NotificationService.initLocalNotification();
  SocketServices.connectToSocket();
  Stripe.publishableKey = stripePublishableKey;


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      ensureScreenSize: true,
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(393, 852),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: Get.key,
        translations: LocalConstants(),
        defaultTransition: Transition.noTransition,
        locale: Locale(PrefsHelper.localizationLanguageCode,
            PrefsHelper.localizationCountryCode),
        fallbackLocale: const Locale("en", "US"),
        theme: themeData,
        transitionDuration: const Duration(milliseconds: 300),
        initialRoute: AppRoutes.subscription,
        getPages: AppRoutes.routes,
      ),
    );


  }
}
