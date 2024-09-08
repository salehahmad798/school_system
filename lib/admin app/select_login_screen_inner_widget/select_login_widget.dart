import 'package:flutter/material.dart';
import 'package:school_system/utils/app_custom_text_style.dart';
import 'package:school_system/widgets/App_custom_text.dart';

// ignore: must_be_immutable
class SelectLoginWidget extends StatelessWidget {
  String title;
  String subtitle;
  String image;
  Color color;
  VoidCallback voidCallbackAction;

  SelectLoginWidget(
      {super.key,
      required this.image,
      required this.subtitle,
      required this.title,
      required this.color,
      required this.voidCallbackAction});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 23),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      image,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(right: 27, top: 17),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: title,
                    textStyle: AppTextStyles().heading(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  CustomText(
                    text: subtitle,
                    textStyle: AppTextStyles().heading(
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
