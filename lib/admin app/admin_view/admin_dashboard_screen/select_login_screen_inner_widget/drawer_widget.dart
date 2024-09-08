import 'package:flutter/material.dart';
import 'package:school_system/utils/app_color.dart';
import 'package:school_system/utils/app_custom_text_style.dart';
import 'package:school_system/widgets/App_custom_text.dart';

// ignore: must_be_immutable
class DrawerWidget extends StatelessWidget {
  String imageVal;
  String nameVal;
  VoidCallback voidCallbackAction;
  bool check;

  DrawerWidget({
    super.key,
    required this.imageVal,
    required this.nameVal,
    required this.check,
    required this.voidCallbackAction,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: voidCallbackAction,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          children: [
            ImageIcon(
              size: 25.0,
              AssetImage(
                imageVal,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            CustomText(
              text: nameVal,
              textStyle: AppTextStyles().heading(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            check == true
                ? const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppColors.kBlack,
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
