import 'package:get/get.dart';
import 'package:school_system/admin%20app/admin_view/admin_dashboard_screen/admin_dashboard_screen.dart';
import 'package:school_system/admin%20app/admin_view/admin_login/admin_login_screen.dart';
import 'package:school_system/common_screen/intro_screen/intro_screen.dart';

import '../admin app/admin_view/admin_bottombar/admin_bottombar_screen.dart';
import '../common_screen/splash_screen.dart';

dynamic routes = [
  GetPage(name: '/', page: () => const SplashScreen()),
  GetPage(
      name: '/adminDashboardScreen', page: () =>  AdminDashboardScreen()),
  GetPage(name: '/adminBottombar', page: () => const AdminBottombarScreen()),
  GetPage(name: '/introScreen', page: () =>  IntroScreen()),
  GetPage(name: '/adminLogin', page: () => const AdminLoginScreen()),
  // GetPage(name: '/subscription', page: () => const Subscription()),
  // GetPage(name: '/home', page: () => Home()),
  // GetPage(name: '/selectcar', page: () => const SelectCar()),
  // GetPage(name: '/selectseats', page: () => SelectSeats()),
  // GetPage(name: '/sendfeedback', page: () => const SendFeedback()),
  // GetPage(name: '/confirmride', page: () => const ConfirmRide()),
  // GetPage(name: '/completeride', page: () => CompleteRide()),
  // GetPage(name: '/location', page: () => Location()),
];
