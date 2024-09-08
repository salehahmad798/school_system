import 'package:flutter/material.dart';
import 'package:school_system/utils/app_color.dart';
import 'package:school_system/utils/app_custom_text_style.dart';
import 'package:school_system/widgets/App_custom_text.dart';

// ignore: must_be_immutable
class HomeStartWidget extends StatelessWidget {
  final String image;
  final Color bgcolor;
  final String title;
  final Color textColor;
  final Color iconColor;
  final Color borderColor;

  final VoidCallback? ontap;

  HomeStartWidget({
    super.key,
    required this.image,
    this.bgcolor = AppColors.kBlueAFF,
    required this.title,
    Color? textColor,
    Color? iconColor,
    Color? borderColor,
    this.ontap,
  })  : textColor = textColor ?? AppColors.kBlue,
        iconColor = iconColor ?? textColor ?? AppColors.kBlue,
        borderColor = borderColor ?? textColor ?? AppColors.kBlue;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: ontap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11.0),
            child: Container(
              width: 158,
              height: 120,
              decoration: BoxDecoration(
                color: bgcolor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: borderColor),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0, bottom: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      image,
                      width: 70,
                      height: 70,
                    ),
                    CustomText(
                      text: title,
                      textStyle: AppTextStyles().normal(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        textColor: textColor,
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Icon(
                          Icons.arrow_forward,
                          size: 20,
                          color: iconColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
