import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_system/services/shearepreference_service.dart';
import 'package:school_system/utils/app_images.dart';
import 'package:school_system/widgets/assignment_widget.dart';
import 'package:school_system/widgets/course_details_widget.dart';
import 'package:school_system/widgets/home_start_widget.dart';
import 'package:school_system/widgets/select_course_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
   checkIntro();
    super.initState();
  }

 

   bool? getintroinfo;
  bool? isUserLogedIn;

  void checkIntro() {
    // yahoooo
    getintroinfo = ShearedprefService.getintroScreen();
    isUserLogedIn = ShearedprefService.getUserLoggedIn();

    Timer(const Duration(seconds: 2), () {
      log('User enter in duration .........');
      if (getintroinfo == false || getintroinfo == null) {
        Get.offAllNamed("/introScreen");
        log('User enter in introScreen .........');
      } else {
        log('------------------- .........');
        if (isUserLogedIn == false || isUserLogedIn == null) {
          log('User enter in first if   .........');
           Get.offAllNamed("/adminLogin");
        } else {
          log('User enter in  else   .........');
          Get.toNamed("/adminBottombar");
        }
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(
          height: 84,
          image: AssetImage(
            AppImages.applogo,
          ),
        ),
      ),
    );
  }
}
