import 'package:flutter/material.dart';
import 'package:school_system/utils/app_color.dart';
import 'package:school_system/utils/app_custom_text_style.dart';
import 'package:school_system/widgets/App_custom_text.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback function;
  final double width;
  final double height;
  final double borderRadius;
  final Color color, tcolor;
  final Color borderColor;
  final EdgeInsets padding;

  const PrimaryButton(
      {super.key,
      required this.text,
      required this.function,
      this.color = AppColors.kPrimary,
      this.width = 160.0,
      this.height = 50,
      this.borderRadius = 10,
      this.padding = EdgeInsets.zero,
      this.tcolor = AppColors.kWhite,
      this.borderColor = AppColors.kPrimary});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color == AppColors.kPrimary
              ? AppColors.kPrimary
              : AppColors.noColor,
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
          border: Border.all(
            color: borderColor == AppColors.kPrimary
                ? AppColors.kPrimary
                : borderColor,
          ),
        ),
        padding: padding,
        child: Center(
          child: CustomText(
            text: text,
            textStyle: AppTextStyles().buttonStyle(
              textColor: tcolor,
            ),
          ),
        ),
      ),
    );
  }
}
