import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_system/student_app/controllers/student_controllers.dart';
import 'package:school_system/student_app/widgets/custom_text_field.dart';
import 'package:school_system/student_app/student_view/student_auth.dart/student_login_screen.dart';
import 'package:school_system/utils/app_color.dart';
import 'package:school_system/utils/app_custom_text_style.dart';
import 'package:school_system/utils/app_textfields.dart';
import 'package:school_system/widgets/App_custom_text.dart';
import 'package:school_system/widgets/app_custom_buttons.dart';
import 'package:school_system/widgets/app_custom_textfield_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    StudentAuth Auth = Get.put(StudentAuth());
    return Scaffold(
      backgroundColor: AppColors.kPrimary,
      body: Column(
        children: [
          Container(
            height: Get.height * 0.15,
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
                    padding: EdgeInsets.only(bottom: 4),
                    child: CustomText(
                      text: 'Sign Up',
                      textStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kWhite,
                      ),
                    ),
                  ),
                  CustomText(
                    text: 'Enter your details below and free sign up',
                    textStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.kWhite,
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
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10), // Reduced top padding
                        child: Column(
                          children: [
                            CustomTextField(
                                controller: StudentControllers.firstName,
                                label: 'First Name',
                                hintText: 'Enter First Name',
                                keyboardType: TextInputType.text,
                                suffixIcon: SizedBox(),
                                prefixIcon: SizedBox()),
                            const SizedBox(height: 8),
                            CustomTextField(
                                controller: StudentControllers.lastName,
                                label: 'Last Name',
                                hintText: 'Enter Last Name',
                                keyboardType: TextInputType.text,
                                suffixIcon: SizedBox(),
                                prefixIcon: SizedBox()),
                            const SizedBox(height: 8),
                            CustomTextField(
                                controller: StudentControllers.emailAddress,
                                label: 'Email Address',
                                hintText: 'Enter Email Address',
                                keyboardType: TextInputType.emailAddress,
                                suffixIcon: SizedBox(),
                                prefixIcon: SizedBox()),
                            const SizedBox(height: 8), // Reduced spacing
                            CustomTextField(
                                controller: StudentControllers.contact,
                                label: 'Contact',
                                hintText: 'Enter Contact Number',
                                keyboardType: TextInputType.number,
                                suffixIcon: SizedBox(),
                                prefixIcon: SizedBox()),
                            const SizedBox(height: 8), // Reduced spacing
                            CustomTextField(
                                controller: StudentControllers.password,
                                label: 'Password',
                                hintText: 'Enter Password',
                                keyboardType: TextInputType.text,
                                suffixIcon: SizedBox(),
                                prefixIcon: SizedBox()),
                            const SizedBox(height: 8),
                            CustomTextField(
                                controller: StudentControllers.confirmPassword,
                                label: 'Confirm Password',
                                hintText: 'Enter Confirm Password',
                                keyboardType: TextInputType.text,
                                suffixIcon: SizedBox(),
                                prefixIcon: SizedBox()),
                            const SizedBox(height: 15),
                            PrimaryButton(
                              text: 'Register',
                              function: () {},
                              width: Get.width * .85,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Obx(
                                  () => Checkbox(
                                    value: Auth.check.value,
                                    onChanged: (bool? value) {
                                      Auth.onCheck(value);
                                    },
                                  ),
                                ),
                                const Expanded(
                                  child: Text(
                                    'By creating an account you have to agree with our terms & conditions',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: 'Poppins',
                                        fontSize: 10),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CustomText(
                                  text: "Already have an account?",
                                  textStyle: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Poppins'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.to(StudentLoginScreen());
                                  },
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
