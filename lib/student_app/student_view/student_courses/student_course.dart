import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_system/admin%20app/admin_view/admin_dashboard_screen/select_login_screen_inner_widget/admin_dashboard_widget.dart';
import 'package:school_system/student_app/student_view/student_courses/course_detail_screen.dart';
import 'package:school_system/utils/app_color.dart';
import 'package:school_system/utils/app_images.dart';
import 'package:school_system/widgets/App_custom_text.dart';
import 'package:school_system/widgets/select_course_widget.dart';

class SelectCourses extends StatelessWidget {
  const SelectCourses({super.key});

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
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: CustomText(
                          text: 'Courses',
                          textStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.kWhite,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: CircleAvatar(
                          minRadius: 25,
                          backgroundImage:
                              AssetImage('assets/app_images/profile.png'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomText(
                    text: '5 Courses',
                    textStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.kWhite,
                    ),
                  ),
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
                            SelectCourseWidget(
                              image: 'assets/app_images/Mind Map.png',
                              courseCode: 'ITEC511-01-2024-242',
                              courseName: 'Machine Learning',
                              courseDepartment:
                                  'Information Technology (with thesis)',
                              ontap: () {
                                Get.to(CourseDetailScreen());
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SelectCourseWidget(
                              image: 'assets/app_images/java.png',
                              courseCode: 'ITEC511-01-2024-242',
                              courseName: 'Java Development',
                              courseDepartment:
                                  'Information Technology (with thesis)',
                              ontap: () {},
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SelectCourseWidget(
                              image: 'assets/app_images/Design.png',
                              courseCode: 'ITEC511-01-2024-242',
                              courseName: 'Visual Design',
                              courseDepartment:
                                  'Information Technology (with thesis)',
                              ontap: () {},
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SelectCourseWidget(
                              image: 'assets/app_images/Align Right.png',
                              courseCode: 'ITEC511-01-2024-242',
                              courseName: 'Master Thesis',
                              courseDepartment:
                                  'Information Technology (with thesis)',
                              ontap: () {},
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Noticeboard container
                ]),
          )
        ],
      ),
    );
  }
}
