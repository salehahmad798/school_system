import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_system/student_app/controllers/student_controllers.dart';
import 'package:school_system/student_app/student_view/student_courses/student_course.dart';
import 'package:school_system/utils/app_color.dart';
import 'package:school_system/utils/app_images.dart';
import 'package:school_system/widgets/App_custom_text.dart';
import 'package:school_system/widgets/app_custom_buttons.dart';
import 'package:school_system/widgets/app_custom_textfield_widget.dart';

class StudentCoursesScreen extends StatelessWidget {
  const StudentCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Courses',
                      textStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kBlack,
                      ),
                    ),
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(AppImages.profile),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Container(
                  width: Get.width * 0.8,
                  child: Image.asset(AppImages.newsFeed),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'To Enroll in courses, enter the code given by teacher',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: AppColors.kBlack,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CustomTextField(
                  controller: StudentControllers.courseCode,
                  label: '',
                  hintText: 'Enter Code',
                  keyboardType: TextInputType.number,
                  suffixIcon: const SizedBox(),
                  prefixIcon: const SizedBox(),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: PrimaryButton(
                  text: 'Submit',
                  function: () {
                    Get.to(SelectCourses());
                  },
                  width: Get.width * 0.9,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
