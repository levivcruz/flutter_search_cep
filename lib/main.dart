import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app/app.dart';
import 'app_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppColors().lightPurpleColor));
    return GetMaterialApp(
      initialRoute: AppRoutes.search,
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      title: 'Flutter Search Cep',
      initialBinding: AppBinding(),
      defaultTransition: Transition.fadeIn,
      theme: AppTheme.theme,
    );
  }
}
