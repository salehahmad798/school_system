import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_system/services/shearepreference_service.dart';
import 'package:school_system/utils/app_color.dart';
import 'package:school_system/utils/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ShearedprefService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: routes,
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: AppColors.kPrimary,
          onPrimary: AppColors.kWhite,
          secondary: AppColors.kWhite,
          onSecondary: AppColors.kRed,
          error: AppColors.kRed,
          onError: AppColors.kWhite,
          surface: AppColors.kWhite,
          onSurface: AppColors.kRed,
        ),
        scaffoldBackgroundColor: AppColors.kWhite,
      ),
    );
  }
}
