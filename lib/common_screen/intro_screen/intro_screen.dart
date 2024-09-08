import 'dart:developer';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:get/get.dart';
import 'package:school_system/admin%20app/admin_view/admin_bottombar/admin_bottombar_screen.dart';
import 'package:school_system/admin%20app/admin_view/admin_login/admin_login_screen.dart';
import 'package:school_system/common_screen/intro_screen/intro_controller.dart/intro_controller.dart';
import 'package:school_system/common_screen/intro_screen/intro_widget/intro_inner_widget.dart';
import 'package:school_system/services/shearepreference_service.dart';
import 'package:school_system/student_app/student_view/student_bottomBar/student_bottombar_screen.dart';
import 'package:school_system/utils/app_color.dart';
import 'package:school_system/utils/app_custom_text_style.dart';
import 'package:school_system/utils/app_images.dart';
import 'package:school_system/widgets/App_custom_text.dart';
import 'package:school_system/widgets/app_custom_buttons.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});

  final IntroController introController = Get.put(IntroController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80.0, right: 57, bottom: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    // Get.to(() => const AdminBottombarScreen());
                    Get.to(() => StudentBottombarScreen());
                  },
                  child: CustomText(
                    text: 'Skip',
                    textStyle: AppTextStyles().normal(
                      textColor: AppColors.kGrey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          FlutterCarousel(
            items: [
              IntroInnerWidget(
                imageVal: AppImages.intro1,
                title: 'Numerous free trial courses',
                description:
                    'Free courses for you to find your way to learning',
              ),
              IntroInnerWidget(
                imageVal: AppImages.intro2,
                title: 'Numerous free trial courses',
                description:
                    'Free courses for you to find your way to learning',
              ),
              IntroInnerWidget(
                imageVal: AppImages.intro3,
                title: 'Numerous free trial courses',
                description:
                    'Free courses for you to find your way to learning',
              ),
            ],
            options: CarouselOptions(
                autoPlay: false,
                autoPlayInterval: const Duration(seconds: 4),
                viewportFraction: 1.0,
                initialPage: 0,
                showIndicator: true,
                floatingIndicator: true,
                onPageChanged: (int index, CarouselPageChangedReason reason) {
                  log(index.toString());
                  introController.updateInnerWidgetVal(index);
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() {
                return introController.innerWidgetVal.value == 0
                    ? Container(
                        width: 28,
                        height: 5,
                        margin: const EdgeInsets.only(right: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: AppColors.kPrimary,
                        ),
                      )
                    : Container(
                        width: 9,
                        height: 5,
                        margin: const EdgeInsets.only(right: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: AppColors.kGreyAff,
                        ),
                      );
              }),
              Obx(() {
                return introController.innerWidgetVal.value == 1
                    ? Container(
                        width: 28,
                        height: 5,
                        margin: const EdgeInsets.only(right: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: AppColors.kPrimary,
                        ),
                      )
                    : Container(
                        width: 9,
                        height: 5,
                        margin: const EdgeInsets.only(right: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: AppColors.kGreyAff,
                        ),
                      );
              }),
              Obx(() {
                return introController.innerWidgetVal.value == 2
                    ? Container(
                        width: 28,
                        height: 5,
                        margin: const EdgeInsets.only(right: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: AppColors.kPrimary,
                        ),
                      )
                    : Container(
                        width: 9,
                        height: 5,
                        margin: const EdgeInsets.only(right: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: AppColors.kGreyAff,
                        ),
                      );
              }),
            ],
          ),
          Obx(() {
            return introController.innerWidgetVal.value == 2
                ? Padding(
                    padding: const EdgeInsets.only(top: 81),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        PrimaryButton(
                          width: 160,
                          text: 'Sign up',
                          function: () {},
                        ),
                        PrimaryButton(
                          width: 160,
                          text: 'Log in',
                          function: () {
                            ShearedprefService.setintroScreen(true);
                            Get.to(
                              () => const AdminLoginScreen(),
                            );
                          },
                          color: AppColors.noColor,
                          tcolor: AppColors.kPrimary,
                        ),
                      ],
                    ),
                  )
                : const SizedBox();
          })
        ],
      ),
    );
  }
}
