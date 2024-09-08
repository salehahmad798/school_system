// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:school_system/utils/app_color.dart';
import 'package:school_system/utils/app_custom_text_style.dart';
import 'package:school_system/widgets/App_custom_text.dart';

class SelectLoginWidget1 extends StatelessWidget {
  String title;
  String image;
  Color color;
  VoidCallback voidCallbackAction;

  SelectLoginWidget1(
      {super.key,
      required this.image,
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
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: title,
                    textStyle: AppTextStyles().heading(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Row(
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
                  IconButton(
                      onPressed: voidCallbackAction,
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: AppColors.kBlack,
                      ))
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
