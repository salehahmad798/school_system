import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_system/student_app/student_view/student_courses/course_timetable.dart';
import 'package:school_system/utils/app_color.dart';
import 'package:school_system/utils/app_images.dart';
import 'package:school_system/widgets/App_custom_text.dart';
import 'package:school_system/widgets/app_custom_buttons.dart';
import 'package:school_system/widgets/assignment_widget.dart';
import 'package:school_system/widgets/select_course_widget.dart';

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 183,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: AppColors.kPrimary,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back,
                          color: AppColors.kBlack,
                        ),
                      ),
                      const SizedBox(
                          width: 10), // Add space between icon and text
                      const CustomText(
                        text: 'Courses',
                        textStyle: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.kWhite,
                        ),
                      ),
                      const Spacer(), // Pushes the profile image to the end
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: CircleAvatar(
                          minRadius: 25,
                          backgroundImage:
                              AssetImage('assets/app_images/profile.png'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Custom navigation bar
                  SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _NavBarItem(title: 'Assignments'),
                        _NavBarItem(title: 'Notes'),
                        _NavBarItem(title: 'Results'),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward,
                              color: AppColors.kWhite,
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(height: 0),
                ],
              ),
            ),
          ),

          // Expanded bottom white section with the Noticeboard Stack
          Expanded(
            child: Stack(
                clipBehavior: Clip.none, // Allow overflow
                children: [
                  // Background white container
                  Container(
                    width: Get.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            PrimaryButton(
                              text: 'View Timetable',
                              function: () {
                                Get.to(CourseTimeTable());
                              },
                              tcolor: AppColors.kPrimary,
                              color: AppColors.kTcolor,
                              width: Get.width * .8,
                            ),
                            const SizedBox(height: 10),
                            AssignmentWidget(
                                image:
                                    'assets/app_images/Signing A Document.png',
                                dueTimeDate: 'Aug 1o,11:59 pm',
                                assignmentNo: 'Assignment 1',
                                assignmentDetails:
                                    'Learn More About Research Method'),
                            const SizedBox(
                              height: 15,
                            ),
                            AssignmentWidget(
                                image:
                                    'assets/app_images/Signing A Document.png',
                                dueTimeDate: 'Aug 1o,11:59 pm',
                                assignmentNo: 'Assignment 1',
                                assignmentDetails:
                                    'Learn More About Research Method'),
                            const SizedBox(
                              height: 15,
                            ),
                            AssignmentWidget(
                                image:
                                    'assets/app_images/Signing A Document.png',
                                dueTimeDate: 'Aug 1o,11:59 pm',
                                assignmentNo: 'Assignment 1',
                                assignmentDetails:
                                    'Learn More About Research Method'),
                            const SizedBox(
                              height: 15,
                            ),
                            AssignmentWidget(
                                image:
                                    'assets/app_images/Signing A Document.png',
                                dueTimeDate: 'Aug 1o,11:59 pm',
                                assignmentNo: 'Assignment 1',
                                assignmentDetails:
                                    'Learn More About Research Method'),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
          )
        ],
      ),
    );
  }
}

// Custom navigation bar item widget
class _NavBarItem extends StatelessWidget {
  final String title;

  const _NavBarItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: CustomText(
        text: title,
        textStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.kWhite,
        ),
      ),
    );
  }
}
