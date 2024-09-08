import 'package:flutter/material.dart';
import 'package:school_system/utils/app_color.dart';
import 'package:school_system/utils/app_custom_text_style.dart';
import 'package:school_system/widgets/App_custom_text.dart';
import 'package:school_system/widgets/app_custom_buttons.dart';

import '../utils/app_images.dart';

// ignore: must_be_immutable
class MenageInsituteWidget extends StatelessWidget {
  String image;
  String title;
  String insituteName;
  String? link;
  VoidCallback? ontap;

  MenageInsituteWidget(
      {super.key,
      required this.image,
      required this.insituteName,
      required this.title,
      this.link,
      this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.kGrey8D2, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(top: 12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 68,
                  width: 68,
                  decoration: BoxDecoration(
                    color: AppColors.kBlueAFF,
                    borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.rectangle,
                  ),
                  padding: const EdgeInsets.all(9),
                  child: Center(
                    child: image == ''
                        ? const Image(
                            image: AssetImage(AppImages.school),
                          )
                        : Image(image: NetworkImage(image)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 13),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: title,
                        textStyle: AppTextStyles().normal(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          textColor: AppColors.kGrey8D2,
                        ),
                      ),
                      const SizedBox(height: 5),
                      CustomText(
                        text: insituteName,
                        textStyle: AppTextStyles().normal(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          textColor: AppColors.kBlack,
                        ),
                      ),
                      const SizedBox(height: 5),
                      link == ''
                          ? const SizedBox()
                          : InkWell(
                              onTap: ontap,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.link_rounded,
                                    color: AppColors.kOrange,
                                  ),
                                  const SizedBox(width: 5),
                                  SizedBox(
                                    width: 150,
                                    child: CustomText(
                                      text: link!,
                                      textStyle: AppTextStyles().normal(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        textColor: AppColors.kBlack,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 19),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PrimaryButton(
                    width: 142,
                    height: 41,
                    text: 'Edit',
                    function: () {},
                    color: AppColors.noColor,
                    tcolor: AppColors.kPrimary,
                    borderColor: AppColors.kPrimary,
                  ),
                  PrimaryButton(
                    width: 142,
                    height: 41,
                    text: 'Delete',
                    function: () {},
                    color: AppColors.noColor,
                    tcolor: AppColors.kRed,
                    borderColor: AppColors.kRed,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
