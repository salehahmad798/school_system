import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:school_system/utils/app_color.dart';
import 'package:school_system/utils/app_custom_text_style.dart';
import 'package:school_system/utils/app_images.dart';
import 'package:school_system/widgets/App_custom_text.dart';
import 'package:school_system/widgets/app_custom_buttons.dart';

// ignore: must_be_immutable
class CourseDetailsWidget extends StatelessWidget {
  String image;
  String courseName;
  String insituteName;

  String logo;
  VoidCallback? ontap;

  CourseDetailsWidget(
      {super.key,
      required this.image,
      required this.insituteName,
      required this.courseName,
     required this.logo,
      this.ontap
      
      
      });

  @override
  Widget build(BuildContext context) {
    return 
       Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: 157,
                  height: 135,
                  decoration: BoxDecoration(color: AppColors.kGrey),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 124,
                  child: Container(
                    width: 26,
                    height: 27,
                    child: Image.asset(logo),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 132,
              child: CustomText(
                maxLines: 2,
                alignText: TextAlign.start,
                text: courseName,
                textStyle: AppTextStyles().heading(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.kBlack),
              ),
            ),
            SizedBox(
              width: 132,
              child: CustomText(
                maxLines: 2,
                alignText: TextAlign.start,
                text: insituteName,
                textStyle: AppTextStyles().heading(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.kGrey8D2),
              ),
            )
          ],
        ));
  }
}
