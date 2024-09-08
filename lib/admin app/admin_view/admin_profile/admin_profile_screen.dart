import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:school_system/admin%20app/controllers/admin_school_controller.dart';
import 'package:school_system/utils/app_color.dart';
import 'package:school_system/utils/app_custom_text_style.dart';
import 'package:school_system/utils/app_images.dart';
import 'package:school_system/widgets/App_custom_text.dart';
import 'package:school_system/widgets/app_custom_buttons.dart';
import 'package:school_system/widgets/app_custom_textfield_widget.dart';

class AdminProfileScreen extends StatelessWidget {
  AdminProfileScreen({super.key});
  final AdminSchoolController menageSchoolController =
      Get.put(AdminSchoolController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimary,
      body: Stack(
        fit: StackFit.loose,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            // padding:
            //     const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: const Column(
              // mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 150,
                ),
              ],
            ),
          ),
          // Background Header
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            color: AppColors.kPrimary,
            child: Center(
              child: CustomText(
                text: 'Profile',
                textStyle: AppTextStyles().heading(
                  textColor: AppColors.kWhite,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // Profile Image and Form
          Positioned(
            top: MediaQuery.of(context).size.height * 0.22,
            left: MediaQuery.of(context).size.width * 0.30,
            child: Container(
              width: 130,
              height: 130,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(AppImages.profile),
                ),
                // border: Border.all(color: Colors.white, width: 4.0),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.32,
            right: MediaQuery.of(context).size.width * 0.35,
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                color: AppColors.kWhite,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {},
                icon: const Icon(
                  Icons.edit,
                  size: 15,
                  color: AppColors.kBlack,
                ),
              ),
            ),
          ),

          // Positioned(
          //     top: MediaQuery.of(context).size.height * 0.4,
          //     right: MediaQuery.of(context).size.width * 0.66,
          //     child: CustomText(
          //       text: 'Current Password',
          //       textStyle: AppTextStyles()
          //           .normal(fontSize: 14, textColor: AppColors.kBlack),
          //     )),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(top: 300, left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: TextEditingController(),
                    label: 'Current Password',
                    hintText: 'Enter Current Password',
                    keyboardType: TextInputType.text,
                    suffixIcon: const SizedBox(),
                    prefixIcon: const SizedBox(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: TextEditingController(),
                    label: 'New Username',
                    hintText: 'Enter New Username',
                    keyboardType: TextInputType.text,
                    suffixIcon: const SizedBox(),
                    prefixIcon: const SizedBox(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Select File',
                        textStyle: AppTextStyles().normal(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          textColor: AppColors.kGrey8D2,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.kGrey8D2,
                          ),
                          color: AppColors.kWhite,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => menageSchoolController.itemImage.value ==
                                      null
                                  ? CustomText(
                                      text: 'Select File',
                                      textStyle: AppTextStyles().normal(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        textColor: AppColors.kGrey8D2,
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        menageSchoolController.pickItemImages();
                                      },
                                      child: Container(
                                        width: 132,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          // color: AppColors.kPrimary,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: FileImage(
                                              File(
                                                menageSchoolController
                                                    .itemImage.value!.path,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                            ),
                            InkWell(
                              onTap: () {
                                log('tap');
                                menageSchoolController.pickItemImages();
                              },
                              child: Container(
                                width: 132,
                                height: 33,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.kPrimary,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(
                                      Icons.folder_rounded,
                                      color: AppColors.kWhite,
                                    ),
                                    CustomText(
                                      text: 'Browse …',
                                      textStyle: AppTextStyles().normal(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        textColor: AppColors.kWhite,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomText(
                      text: 'For Course Cover Picture (Only: jpg, jpeg, png)',
                      textStyle: AppTextStyles().normal(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        textColor: AppColors.kGrey8D2,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: TextEditingController(),
                    label: ' New Password',
                    hintText: 'Enter New Password',
                    keyboardType: TextInputType.text,
                    suffixIcon: const SizedBox(),
                    prefixIcon: const SizedBox(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: TextEditingController(),
                    label: 'Confirm Password',
                    hintText: 'Enter Confirm Password',
                    keyboardType: TextInputType.text,
                    suffixIcon: const SizedBox(),
                    prefixIcon: const SizedBox(),
                  ),
                  const SizedBox(
                    height: 33,
                  ),
                  PrimaryButton(
                      text: 'Update Profile',
                      color: AppColors.kWhite,
                      tcolor: AppColors.kBlue,
                      width: Get.width,
                      function: () {})
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
