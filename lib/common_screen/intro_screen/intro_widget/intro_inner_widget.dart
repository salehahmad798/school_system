import 'package:flutter/material.dart';
import 'package:school_system/utils/app_custom_text_style.dart';
import 'package:school_system/widgets/App_custom_text.dart';

// ignore: must_be_immutable
class IntroInnerWidget extends StatelessWidget {
  String imageVal;
  String title;
  String description;
  IntroInnerWidget({
    super.key,
    required this.imageVal,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 260,
          width: 260,
          child: Image(
            image: AssetImage(
              imageVal,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 38,
            bottom: 6,
          ),
          child: SizedBox(
            width: 198,
            child: CustomText(
                text: title,
                textStyle: AppTextStyles().heading(
                  fontSize: 22,
                )),
          ),
        ),
        SizedBox(
          width: 198,
          child: CustomText(
            text: description,
            textStyle: AppTextStyles().normal(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
