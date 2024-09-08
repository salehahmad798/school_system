import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_system/admin%20app/admin_view/admin_dashboard_screen/select_login_screen_inner_widget/admin_dashboard_widget.dart';
import 'package:school_system/utils/app_color.dart';
import 'package:school_system/utils/app_custom_text_style.dart';
import 'package:school_system/utils/app_images.dart';
import 'package:school_system/widgets/App_custom_text.dart';
import 'package:school_system/widgets/assignment_widget.dart';
import 'package:school_system/widgets/course_details_widget.dart';

class StudentDashBoard extends StatelessWidget {
  const StudentDashBoard({super.key});

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
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: CustomText(
                          text: 'Hi, Kristin',
                          textStyle: AppTextStyles().heading(
                              textColor: AppColors.kWhite,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 2),
                        child: CircleAvatar(
                          minRadius: 25,
                          backgroundImage: AssetImage(AppImages.profile),
                        ),
                      ),
                    ],
                  ),
                  CustomText(
                    text: 'Let\'s start learning',
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
                          const SizedBox(height: 80),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomText(
                                text: 'Universities',
                                textStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.kBlack,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                              height: 20), // Adjust spacing if needed

                          // Horizontal list for universities
                          SizedBox(
                            height: 200,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  3, // Number of items you want to display
                              itemBuilder: (context, index) {
                                return CourseDetailsWidget(
                                  image: AppImages
                                      .uniimg, // Path to your university image
                                  insituteName: "University of Maryland",
                                  courseName:
                                      "Bachelor of Science in Cybersecurity Management",
                                  logo: AppImages
                                      .unilogo, // Path to a logo or icon
                                );
                              },
                            ),
                          ),

                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomText(
                                text: 'Colleges',
                                textStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.kBlack,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                              height: 20), // Adjust spacing if needed

                          // Horizontal list for colleges
                          SizedBox(
                            height: 200,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  3, // Number of items you want to display
                              itemBuilder: (context, index) {
                                return CourseDetailsWidget(
                                  image: AppImages
                                      .uniimg, // Path to your university image
                                  insituteName: "University of Maryland",
                                  courseName:
                                      "Bachelor of Science in Cybersecurity Management",
                                  logo: AppImages
                                      .unilogo, // Path to a logo or icon
                                );
                              },
                            ),
                          ),

                          const SizedBox(
                            height: 15,
                          ),
                          SelectLoginWidget(
                            image: 'assets/app_images/4320553_2286301 1.png',
                            subtitle: '--->',
                            title: 'Old Question Papers',
                            color: AppColors.kLightYellow,
                            voidCallbackAction: () {},
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SelectLoginWidget(
                            image: 'assets/app_images/paper.png',
                            subtitle: '0',
                            title: 'Quiz/Exams',
                            color: AppColors.kLightYellow,
                            voidCallbackAction: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Noticeboard container
                Positioned(
                  top:
                      -50, // Place the container partially over the blue section
                  left: 20,
                  right: 20,
                  child: Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white, // White color for the noticeboard
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomText(
                            text: 'Noticeboard',
                            textStyle: AppTextStyles().subHeading(
                                textColor: AppColors.kBlack,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 12),

                          // Centered message with quotes
                          Expanded(
                            child: Center(
                              child: CustomText(
                                alignText: TextAlign.center,
                                text: '"Closed for renovation improvements"',
                                textStyle: AppTextStyles().subHeading(
                                    textColor: AppColors.kBlack,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
