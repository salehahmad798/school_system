import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_system/admin%20app/admin_view/admin_dashboard_screen/select_login_screen_inner_widget/admin_dashboard_widget.dart';
import 'package:school_system/admin%20app/admin_view/menage_school.dart/add_admin_school.dart';
import 'package:school_system/admin%20app/controllers/admin_college_controller.dart';
import 'package:school_system/common_screen/select_login/select_login_widget.dart';
import 'package:school_system/student_app/student_view/student_auth.dart/student_login_screen.dart';
import 'package:school_system/utils/app_color.dart';
import 'package:school_system/utils/app_custom_text_style.dart';
import 'package:school_system/widgets/app_custom_buttons.dart';
import 'package:school_system/widgets/menage_insitute_widget.dart';
import '../../../../widgets/App_custom_text.dart';

class SelectLoginScreen extends StatelessWidget {
  SelectLoginScreen({super.key});

  final MenageCollegeController adminCollegeController =
      Get.put(MenageCollegeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kPrimary,
        body: Column(
          children: [
            Container(
                height: 183,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: AppColors.kPrimary,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            padding: const EdgeInsets.all(0),
                            icon: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: AppColors.kWhite,
                            ),
                          ),
                          CustomText(
                            text: 'Select Login',
                            textStyle: AppTextStyles().heading(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                textColor: AppColors.kWhite),
                          )
                        ],
                      ),
                    ],
                  ),
                )),
            Expanded(
              child: Container(
                  // height: MediaQuery.of(context).size.height * 0.3,
                  width: Get.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: Column(
                      children: [
                        const Center(
                          child: Text(
                            'Welcome to EDUMAT',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.kBlack,
                                fontFamily: 'Poppins'),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SelectLoginWidget1(
                          image: 'assets/app_images/learner.png',
                          title: 'Learner',
                          color: const Color(0x336B4668),
                          voidCallbackAction: () {
                            Get.to(StudentLoginScreen());
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SelectLoginWidget1(
                          image: 'assets/app_images/principle.png',
                          title: 'Principle',
                          color: const Color(0x1A0277BD),
                          voidCallbackAction: () {},
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SelectLoginWidget1(
                          image: 'assets/app_images/staff.png',
                          title: 'Staff',
                          color: const Color(0x1AF7966C),
                          voidCallbackAction: () {},
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ));
  }
}
