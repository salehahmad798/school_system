import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_system/utils/app_color.dart';
import 'package:school_system/utils/app_custom_text_style.dart';
import 'package:school_system/widgets/App_custom_text.dart';

class AppSnackbars {
  successSnackBar(
    message, {
    position = SnackPosition.BOTTOM,
    duration = 1500,
    overlay = false,
  }) {
    return Get.snackbar(
      "Success",
      message,
      titleText: CustomText(
        text: "Success",
        textStyle: AppTextStyles().subHeading(),
      ),
      messageText: CustomText(
        text: message,
        maxLines: 2,
        textStyle: AppTextStyles().normal(
          textColor: AppColors.kWhite,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
      overlayBlur: overlay ? 2.0 : null,
      overlayColor: overlay ? AppColors.kBlack.withOpacity(.2) : null,
      colorText: AppColors.kWhite,
      backgroundColor: AppColors.kGreen,
      snackPosition: position,
      margin: const EdgeInsets.all(0.5),
      duration: Duration(
        milliseconds: duration,
      ),
    );
  }

  errorSnackBar(
    message, {
    position = SnackPosition.BOTTOM,
    duration = 1500,
    overlay = false,
  }) {
    return Get.snackbar(
      "Error",
      message,
      titleText: CustomText(
        text: "Error",
        textStyle: AppTextStyles().subHeading(),
      ),
      messageText: CustomText(
        text: message,
        maxLines: 2,
        textStyle: AppTextStyles().normal(
          textColor: AppColors.kWhite,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
      overlayBlur: overlay ? 2.0 : null,
      overlayColor: overlay ? AppColors.kBlack.withOpacity(.2) : null,
      colorText: AppColors.kWhite,
      backgroundColor: AppColors.kRed,
      snackPosition: position,
      margin: const EdgeInsets.all(0.5),
      duration: Duration(
        milliseconds: duration,
      ),
    );
  }

  infoSnackBar(
    message, {
    String title = "Info",
    Color backgroundColor = AppColors.kPrimary,
    Color textColor = AppColors.kWhite,
    position = SnackPosition.BOTTOM,
    duration = 1500,
    overlay = false,
  }) {
    return Get.snackbar(
      title,
      message,
      titleText: CustomText(
        text: title,
        textStyle: AppTextStyles().subHeading(),
      ),
      messageText: CustomText(
        text: message,
        maxLines: 2,
        textStyle: AppTextStyles().normal(
          textColor: AppColors.kWhite,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
      colorText: textColor,
      backgroundColor: backgroundColor,
      snackPosition: position,
      margin: const EdgeInsets.all(0.5),
      duration: Duration(
        milliseconds: duration,
      ),
    );
  }
}
