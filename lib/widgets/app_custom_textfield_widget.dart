import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:get/get.dart';
import 'package:school_system/utils/app_color.dart';
import 'package:school_system/utils/app_custom_text_style.dart';

import 'App_custom_text.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final String hintText;
  final TextInputType keyboardType;
  final bool isPassword;
  final bool isCPassword;
  final bool enable;
  final bool onlyText;
  final bool onlyTextNumber;
  final bool onlyNumberDot;
  final bool onlyNumber;
  final bool onlyNumberDash;
  final Widget suffixIcon;
  final bool hasSuffix;
  final Color suffixIconColor;
  final double suffixIconSize, height, width;
  final bool hasPrefix;
  final VoidCallback? suffixIconFunction;
  final Widget prefixIcon;
  final Color themeColor;
  final VoidCallback? prefixIconFunction;
  final String? Function(String?)? function;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    required this.keyboardType,
    this.isPassword = false,
    this.isCPassword = false,
    this.enable = true,
    required this.suffixIcon,
    required this.prefixIcon,
    this.suffixIconFunction,
    this.prefixIconFunction,
    this.function,
    this.hasSuffix = true,
    this.hasPrefix = true,
    this.themeColor = AppColors.kWhite,
    this.suffixIconColor = AppColors.kBlack,
    this.suffixIconSize = .06,
    this.onlyText = false,
    this.onlyTextNumber = false,
    this.onlyNumberDot = false,
    this.onlyNumber = false,
    this.onlyNumberDash = false,
    this.height = .06,
    this.width = .9,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: label,
          textStyle: AppTextStyles().normal(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            textColor: AppColors.kGrey8D2,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.kWhite,
            // boxShadow: [
            //   BoxShadow(color: AppColors.kGrey.withOpacity(.2), blurRadius: 5),
            // ],
          ),
          // padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            enabled: enable,
            controller: controller,
            textInputAction: TextInputAction.next,
            cursorColor: AppColors.kBlack,
            cursorWidth: 2.0,
            cursorHeight: 15,
            obscureText: isPassword,
            // cursorErrorColor: AppColors.kBlack,
            // ? isCPassword
            //     ? obscureTextCP.value
            //     : obscureText.value
            // : defaultObscureText.value,
            keyboardType: keyboardType,
            inputFormatters: [
              keyboardType == TextInputType.phone
                  ? FilteringTextInputFormatter.allow(
                      RegExp("[0-9]"),
                    )
                  : onlyText
                      ? FilteringTextInputFormatter.allow(
                          RegExp("[a-zA-Z ]"),
                        )
                      : onlyTextNumber
                          ? FilteringTextInputFormatter.allow(
                              RegExp("[a-zA-Z 0-9]"),
                            )
                          : onlyNumberDot
                              ? FilteringTextInputFormatter.allow(
                                  RegExp("[0-9 \\.]"),
                                )
                              : onlyNumberDash
                                  ? FilteringTextInputFormatter.allow(
                                      RegExp("[0-9 \\-]"),
                                    )
                                  : onlyNumber
                                      ? FilteringTextInputFormatter.allow(
                                          RegExp("[0-9]"),
                                        )
                                      : FilteringTextInputFormatter.allow(
                                          RegExp("[a-zA-Z , @/:? 0-9 \\- _ .]"),
                                        ),
              keyboardType == TextInputType.phone
                  ? FilteringTextInputFormatter.deny(
                      RegExp('[\\.|\\,\\-\\_]'),
                    )
                  : FilteringTextInputFormatter.deny(
                      RegExp('[\\#]'),
                    ),
            ],
            style: const TextStyle(
              color: AppColors.kBlack,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            validator: function,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              suffixIcon:
                  //  hasSuffix
                  // ? InkWell(
                  //     onTap: isPassword
                  //         ? () {
                  // obscureText.value = !obscureText.value;
                  //       }
                  //     : suffixIconFunction,
                  // child:
                  //  isPassword
                  //     ? obscureText.value
                  //         ?
                  //  Icon(
                  //     CupertinoIcons.eye,
                  //     color: suffixIconColor,
                  //     size: kWidth(suffixIconSize),
                  //   )
                  //     : Icon(
                  //         CupertinoIcons.eye_slash,
                  //         color: suffixIconColor,
                  //         size: kWidth(suffixIconSize),
                  //       )
                  // : suffixIcon,
                  //   )
                  // :
                  null,
              isDense: true,
              prefixIcon: hasPrefix
                  ? InkWell(
                      onTap: prefixIconFunction,
                      child: prefixIcon,
                    )
                  : null,
              label: Text(
                hintText,
                style: const TextStyle(
                  color: AppColors.kGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              labelStyle: const TextStyle(
                color: AppColors.kBlack,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              hintText: hintText,
              hintStyle: const TextStyle(
                color: AppColors.kGrey,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppColors.kGrey8D2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppColors.kGrey8D2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppColors.kGrey8D2,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppColors.kGrey8D2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
