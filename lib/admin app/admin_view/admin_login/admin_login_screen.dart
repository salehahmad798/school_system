import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:school_system/utils/app_color.dart';
import 'package:school_system/utils/app_custom_text_style.dart';
import 'package:school_system/utils/app_textfields.dart';
import 'package:school_system/widgets/App_custom_text.dart';
import 'package:school_system/widgets/app_custom_buttons.dart';

import '../../controllers/auth_controller.dart';

class AdminLoginScreen extends StatelessWidget {
  const AdminLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthenticationController());
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 21),
            height: 526,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: AppColors.kGreyF39,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 58, horizontal: 20),
              child: Column(
                children: [
                  Center(
                    child: CustomText(
                      text: 'Welcome',
                      textStyle: AppTextStyles().heading(
                        textColor: AppColors.kPrimary,
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 45),
                    child: Center(
                      child: CustomText(
                        text: 'Admin',
                        textStyle: AppTextStyles().heading(
                          textColor: AppColors.kPrimary,
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: AppTextfieldControllers.adminSignInEmail,
                      textInputAction: TextInputAction.next,
                      cursorColor: AppColors.kBlack,
                      cursorWidth: 2.0,
                      cursorHeight: 15,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(
                        color: AppColors.kBlack,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        prefixIcon: const Icon(
                          Icons.person,
                          color: AppColors.kGrey,
                        ),
                        filled: true,
                        fillColor: AppColors.kWhite,
                        isDense: true,
                        hintText: 'Username',
                        hintStyle: const TextStyle(
                          color: AppColors.kGrey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 20),
                    child: SizedBox(
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: AppTextfieldControllers.adminSignInPassword,
                        textInputAction: TextInputAction.next,
                        cursorColor: AppColors.kBlack,
                        cursorWidth: 2.0,
                        cursorHeight: 15,
                        keyboardType: TextInputType.text,
                        style: const TextStyle(
                          color: AppColors.kBlack,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: AppColors.kGrey,
                          ),
                          filled: true,
                          fillColor: AppColors.kWhite,
                          isDense: true,
                          hintText: 'Password',
                          hintStyle: const TextStyle(
                            color: AppColors.kGrey,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Obx(() => authController.sinINBool.value
                      ? const CircularProgressIndicator()
                      : PrimaryButton(
                          text: 'Login',
                          function: () {
                            if (AppTextfieldControllers
                                    .adminSignInEmail.text.isEmpty &&
                                AppTextfieldControllers
                                    .adminSignInPassword.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: "Fields Are Missing!");
                            } else {
                              authController.signInUser();
                            }
                          },
                          width: MediaQuery.of(context).size.width,
                        )),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Center(
                      child: CustomText(
                        text: 'If you are not an admin don’t try to login',
                        maxLines: 2,
                        textStyle: AppTextStyles().heading(
                          textColor: AppColors.kGrey,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
