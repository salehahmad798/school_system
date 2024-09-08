import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_system/student_app/controllers/student_controllers.dart';
import 'package:school_system/student_app/student_view/student_bottomBar/student_bottombar_screen.dart';
import 'package:school_system/student_app/widgets/custom_text_field.dart';
import 'package:school_system/student_app/student_view/student_auth.dart/student_signUp.dart';
import 'package:school_system/utils/app_color.dart';
import 'package:school_system/utils/app_custom_text_style.dart';
import 'package:school_system/utils/app_textfields.dart';
import 'package:school_system/widgets/App_custom_text.dart';
import 'package:school_system/widgets/app_custom_buttons.dart';
import 'package:school_system/widgets/app_custom_textfield_widget.dart';

class StudentLoginScreen extends StatelessWidget {
  const StudentLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimary,
      body: Column(
        children: [
          Container(
            height: Get.height * 0.2,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: AppColors.kPrimary,
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 15),
                    child: Row(
                      children: [
                        CustomText(
                            text: 'Log In',
                            textStyle: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.kWhite,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: Get.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Column(
                          children: [
                            CustomTextField(
                                controller: StudentControllers.studentSignInEmail,
                                label: 'Your Email',
                                hintText: 'Enter Email',
                                keyboardType: TextInputType.emailAddress,
                                suffixIcon: SizedBox(),
                                prefixIcon: SizedBox()),
                            const SizedBox(height: 15),
                            CustomTextField(
                                controller:
                                    StudentControllers.studentSignInPassword,
                                label: 'Password',
                                hintText: 'Enter Password',
                                keyboardType: TextInputType.emailAddress,
                                suffixIcon: const Icon(Icons.visibility_off),
                                prefixIcon: SizedBox()),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Forget Password",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            PrimaryButton(
                              text: 'Log In',
                              function: () {
                                Get.to(StudentBottombarScreen());
                              },
                              width: Get.width * .9,
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CustomText(
                                  text: "Don't have an account?",
                                  textStyle: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Poppins'),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Get.to(SignupScreen());
                                    },
                                    child: const Text(
                                      'SignUP',
                                      style: TextStyle(fontFamily: 'Poppins'),
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
