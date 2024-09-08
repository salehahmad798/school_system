import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_system/admin%20app/controllers/admin_school_controller.dart';
import 'package:school_system/utils/app_color.dart';
import 'package:school_system/utils/app_custom_text_style.dart';
import 'package:school_system/utils/app_textfields.dart';
import 'package:school_system/widgets/App_custom_text.dart';
import 'package:school_system/widgets/app_custom_buttons.dart';
import 'package:school_system/widgets/app_custom_textfield_widget.dart';

class AddAdminSchoolScrenn extends StatelessWidget {
  AddAdminSchoolScrenn({super.key});

  final AdminSchoolController menageSchoolController =
      Get.put(AdminSchoolController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kPrimary,
        body: Column(
          children: [
            Container(
                height: 123,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: AppColors.kPrimary,
                ),
                child: Center(
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
                          text: 'Add School',
                          textStyle: AppTextStyles().heading(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              textColor: AppColors.kWhite),
                        )
                      ],
                    ),
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
                      horizontal: 20,
                      vertical: 33,
                    ),
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
                          const SizedBox(height: 30),
                          CustomTextField(
                            controller: AppTextfieldControllers.adminschoolName,
                            label: 'Add new school',
                            hintText: 'Enter School Name',
                            keyboardType: TextInputType.text,
                            suffixIcon: const SizedBox(),
                            prefixIcon: const SizedBox(),
                          ),
                          const SizedBox(height: 15),
                          CustomTextField(
                            controller: AppTextfieldControllers.adminSchoolLink,
                            label: 'Add school link',
                            hintText: 'Enter School link',
                            keyboardType: TextInputType.text,
                            suffixIcon: const SizedBox(),
                            prefixIcon: const SizedBox(),
                          ),
                          const SizedBox(height: 15),
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
                                      () => menageSchoolController
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
                                                menageSchoolController
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
                                                        menageSchoolController
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
                                        log('tap');
                                        menageSchoolController.pickItemImages();
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
                            () => menageSchoolController
                                    .adminAddSchoolBool.value
                                ? const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CircularProgressIndicator(),
                                    ],
                                  )
                                : PrimaryButton(
                                    text: 'Add School',
                                    function: () {
                                      menageSchoolController.addAdminSchool();
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
