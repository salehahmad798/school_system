import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_system/utils/app_color.dart';
import 'package:school_system/utils/app_custom_text_style.dart';
import 'package:school_system/utils/app_images.dart';
import 'package:school_system/widgets/App_custom_text.dart';
import 'package:school_system/widgets/app_custom_buttons.dart';

// ignore: must_be_immutable
class AssignmentWidget extends StatelessWidget {
  String image;
  Color bgimgcolor;
  String assignmentNo;
  String assignmentDetails;
  String dueTimeDate;

  VoidCallback? ontap;

  AssignmentWidget(
      {super.key,
      required this.image,
      this.bgimgcolor = AppColors.kBlueAFF,
      required this.dueTimeDate,
      required this.assignmentNo,
      required this.assignmentDetails,
      this.ontap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11.0),
        child: Card(
          elevation: 2,
          child: Container(
            width: 335,
            height: 96,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.kGrey8D2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                children: [
                  Container(
                    width: 68,
                    height: 68,
                    decoration: BoxDecoration(
                      color: bgimgcolor,
                      // color: AppColors.kBlue.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      image,
                      // AppImages.mindmap,
                      // width: 50,
                      // height: 50,
                    ),
                  ),
                  SizedBox(width: 18),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: assignmentNo,
                          // text: 'Machine Learning',
                          textStyle: AppTextStyles().normal(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            textColor: AppColors.kBlack,
                          ),
                        ),
                        SizedBox(
                          width: 136,
                          child: CustomText(
                            alignText: TextAlign.start,
                            maxLines: 2,
                            text: assignmentDetails,
                            // text: 'ITEC511-01-2024-242',
                            textStyle: AppTextStyles().normal(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              textColor: AppColors.kGrey8D2,
                            ),
                          ),
                        ),
                        CustomText(
                          text: dueTimeDate,
                          // text: '''INFORMATION TECHNOLOGY (With thesis)''',
                          textStyle: AppTextStyles().normal(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            textColor: AppColors.kRed905,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: ontap,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
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
