import 'package:flutter/material.dart';
import 'package:school_system/utils/app_color.dart';

class AppTextStyles {
  static const normalText = FontWeight.w400;
  static const mediumText = FontWeight.w500;
  static const semiBoldText = FontWeight.w600;
  static const boldText = FontWeight.w700;

  heading({
    Color textColor = AppColors.kBlackF39,
    double fontSize = 18,
    FontWeight fontWeight = boldText,
  }) {
    return TextStyle(
      color: textColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  subHeading({
    Color textColor = AppColors.kBlackF39,
    double fontSize = 16,
    FontWeight fontWeight = semiBoldText,
  }) {
    return TextStyle(
      color: textColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  normal({
    Color textColor = AppColors.kBlackF39,
    double fontSize = 14,
    FontWeight fontWeight = normalText,
  }) {
    return TextStyle(
      color: textColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  small({
    Color textColor = AppColors.kBlackF39,
    double fontSize = 10,
    FontWeight fontWeight = normalText,
  }) {
    return TextStyle(
      color: textColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  buttonStyle({
    Color textColor = AppColors.kWhite,
    double fontSize = 16,
    FontWeight fontWeight = semiBoldText,
  }) {
    return TextStyle(
      color: textColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  buttonStyle1({
    Color textColor = AppColors.kBlackF39,
    double fontSize = 16,
    FontWeight fontWeight = semiBoldText,
  }) {
    return TextStyle(
      color: textColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }
}
