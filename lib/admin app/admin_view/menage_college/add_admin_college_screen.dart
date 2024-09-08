import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_system/admin%20app/controllers/admin_college_controller.dart';
import 'package:school_system/utils/app_color.dart';
import 'package:school_system/utils/app_custom_text_style.dart';
import 'package:school_system/utils/app_textfields.dart';
import 'package:school_system/widgets/App_custom_text.dart';
import 'package:school_system/widgets/app_custom_buttons.dart';
import 'package:school_system/widgets/app_custom_textfield_widget.dart';

class AddCollegeScreen extends StatelessWidget {
  AddCollegeScreen({super.key});

  final MenageCollegeController menageCollegeController =
      Get.put(MenageCollegeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kPrimary,
        body: Column(
          children: [
            Container(
                height: 153,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: AppColors.kPrimary,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
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
                        text: 'Add University',
                        textStyle: AppTextStyles().heading(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            textColor: AppColors.kWhite),
                      )
                    ],
                  ),
                )),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 16),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'NOTE:',
                            textStyle: AppTextStyles().normal(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              textColor: AppColors.kRed,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: CustomText(
                              text: 'Follow The Instructions',
                              textStyle: AppTextStyles().normal(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                textColor: AppColors.kBlack999,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: RichText(
                              text: TextSpan(
                                text: 'Add Your Links starts with',
                                style: AppTextStyles().normal(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  textColor: AppColors.kBlack999,
                                ),
                                children: [
                                  WidgetSpan(
                                    child: CustomText(
                                      text: ' www',
                                      textStyle: AppTextStyles().normal(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        textColor: AppColors.kRed,
                                      ),
                                    ),
                                  ),
                                  WidgetSpan(
                                    child: CustomText(
                                      text: ' instead of',
                                      textStyle: AppTextStyles().normal(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        textColor: AppColors.kBlack999,
                                      ),
                                    ),
                                  ),
                                  WidgetSpan(
                                    child: CustomText(
                                      text: ' https',
                                      textStyle: AppTextStyles().normal(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        textColor: AppColors.kRed,
                                      ),
                                    ),
                                  ),
                                  WidgetSpan(
                                    child: CustomText(
                                      text: ' (Because https already added)',
                                      textStyle: AppTextStyles().normal(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        textColor: AppColors.kBlack999,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          CustomTextField(
                            controller: AppTextfieldControllers.adminCollegeName,
                            label: 'Enter University Name',
                            hintText: 'University Name',
                            keyboardType: TextInputType.text,
                            suffixIcon: const Icon(Icons.abc),
                            prefixIcon: const Icon(Icons.abc),
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: AppTextfieldControllers.adminCollegeLink,
                            label: 'Enter University Website Link',
                            hintText: 'Web Link',
                            keyboardType: TextInputType.text,
                            suffixIcon: const Icon(Icons.abc),
                            prefixIcon: const Icon(Icons.abc),
                          ),
                          const SizedBox(height: 10),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Obx(
                                      () => menageCollegeController
                                                  .itemImage.value ==
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
                                                menageCollegeController
                                                    .pickItemImages();
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
                                                        menageCollegeController
                                                            .itemImage
                                                            .value!
                                                            .path,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        menageCollegeController
                                            .pickItemImages();
                                      },
                                      child: Container(
                                        width: 132,
                                        height: 33,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                          Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: CustomText(
                                text:
                                    'For Course Cover Picture (Only: jpg, jpeg, png)',
                                textStyle: AppTextStyles().normal(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  textColor: AppColors.kGrey8D2,
                                )),
                          ),
                          const SizedBox(
                            height: 33,
                          ),
                          Obx(
                            () => menageCollegeController
                                    .addAdminCollege.value
                                ? const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CircularProgressIndicator(),
                                    ],
                                  )
                                : PrimaryButton(
                                    text: 'Add University',
                                    function: () {
                                      menageCollegeController
                                          .addAdminCollegeFun();
                                    },
                                    color: AppColors.kPrimary,
                                    tcolor: AppColors.kWhite,
                                    width: Get.width,
                                  ),
                          )
                        ],
                      ),
                    ),
                  )),
            ),
          ],
        ));
  }
}
