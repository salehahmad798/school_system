import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_system/admin%20app/admin_view/admin_dashboard_screen/select_login_screen_inner_widget/drawer_widget.dart';
import 'package:school_system/admin%20app/admin_view/admin_profile/admin_profile_screen.dart';
import 'package:school_system/admin%20app/admin_view/menage_college/menage_college_screen.dart';
import 'package:school_system/admin%20app/admin_view/menage_university/menage_university_screen.dart';
import 'package:school_system/utils/app_color.dart';
import 'package:school_system/utils/app_custom_text_style.dart';
import 'package:school_system/utils/app_images.dart';
import 'package:school_system/utils/app_routes.dart';
import 'package:school_system/widgets/App_custom_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controllers/admin_dashboard_controller.dart';
import '../admin_old_paper/admin_old_paper_screen.dart';
import '../menage_school.dart/menage_school_screen.dart';
import 'select_login_screen_inner_widget/admin_dashboard_widget.dart';

class AdminDashboardScreen extends StatelessWidget {
  AdminDashboardScreen({super.key});

  final AdminDashboardController adminDashboardController =
      Get.put(AdminDashboardController());

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 135),
        child: Container(
          color: AppColors.kGreyF39,
          padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
          height: 135,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Builder(builder: (context) {
                return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: AppColors.kBlack,
                  ),
                );
              }),
              const Image(
                  height: 56, width: 165, image: AssetImage(AppImages.applogo)),
              IconButton(
                onPressed: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.remove('userData');
                  prefs.remove('userLoggedIn');
                  Get.offAllNamed("/adminLogin");
                },
                icon: const Icon(
                  Icons.login,
                  color: AppColors.kBlack,
                ),
              )
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 51),
          child: ListView(
            // Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              Obx(
                () => adminDashboardController.adminUser.value == null
                    ? const CircleAvatar(
                        backgroundImage: AssetImage(AppImages.profile),
                        radius: 100,
                      )
                    : Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              adminDashboardController
                                  .adminUser.value!.detail!.img
                                  .toString(),
                            ),
                          ),
                        )),

                // CachedNetworkImage(
                //     height: 100,
                //     width: 100,
                //     imageUrl: adminDashboardController
                //         .adminUser.value!.detail!.img
                //         .toString(),
                //     placeholder: (context, url) => const SizedBox(
                //       height: 50,
                //       width: 50,
                //       child: CircularProgressIndicator(),
                //     ),
                //     errorWidget: (context, url, error) =>
                //         const Icon(Icons.error),
                //   ),
              ),
              // adminUser == null
              //     ? const CircleAvatar(
              //         backgroundImage: AssetImage(AppImages.profile),
              //         radius: 100,
              //       )
              //     : CachedNetworkImage(
              //         height: 100,
              //         width: 100,
              //         imageUrl: adminUser!.detail!.img.toString(),
              //         placeholder: (context, url) =>
              //             const CircularProgressIndicator(),
              //         errorWidget: (context, url, error) =>
              //             const Icon(Icons.error),
              //       ),

              // CircleAvatar(
              //     backgroundImage: NetworkImage(
              //       adminUser!.detail!.img.toString(),
              //     ),
              //     radius: 100,
              //   ),
              Obx(
                () => adminDashboardController.adminUser.value == null
                    ? Padding(
                        padding: const EdgeInsets.only(top: 14.0),
                        child: CustomText(
                          text: 'User',
                          textStyle: AppTextStyles().heading(
                            textColor: AppColors.kBlack,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 14.0),
                        child: CustomText(
                          text: adminDashboardController
                              .adminUser.value!.detail!.username
                              .toString(),
                          textStyle: AppTextStyles().heading(
                            textColor: AppColors.kBlack,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
              ),

              DrawerWidget(
                  imageVal: AppImages.dashboardIcon,
                  nameVal: 'Dashboard',
                  check: false,
                  voidCallbackAction: () {
                    Get.back();
                  }),
              DrawerWidget(
                  imageVal: AppImages.profileIcon,
                  nameVal: 'Profile',
                  check: true,
                  voidCallbackAction: () {
                    Get.to(() => AdminProfileScreen());
                  }),
              DrawerWidget(
                  imageVal: AppImages.schoolIcondashboard,
                  nameVal: 'School',
                  check: false,
                  voidCallbackAction: () {
                    Get.to(() => MenageSchoolScreen());
                  }),
              DrawerWidget(
                  imageVal: AppImages.schoolIcondashboard,
                  nameVal: 'Universities',
                  check: false,
                  voidCallbackAction: () {
                    Get.to(() => MenageUniversityScreen());
                  }),
              DrawerWidget(
                imageVal: AppImages.schoolIcondashboard,
                nameVal: 'Colleges',
                check: false,
                voidCallbackAction: () {
                  Get.to(
                    () => MenageCollegeScreen(),
                  );
                },
              ),
              DrawerWidget(
                imageVal: AppImages.oldquestionIcon,
                nameVal: 'Old Questions Papers',
                check: false,
                voidCallbackAction: () {
                  Get.to(() => MenageOldPaperScreen());
                },
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 23,
          vertical: 16,
        ),
        child: adminDashboardController.dashboardBool.value
            ? const Center(child: CircularProgressIndicator())
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CustomText(
                      text: 'Hi, Welcome',
                      textStyle: AppTextStyles().heading(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        textColor: AppColors.kBlack,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Obx(
                    () => adminDashboardController.adminDashboard.value == null
                        ? SelectLoginWidget(
                            image: AppImages.teacher,
                            subtitle: '0',
                            title: 'Teachers',
                            color: AppColors.kBrown,
                            voidCallbackAction: () {},
                          )
                        : SelectLoginWidget(
                            image: AppImages.teacher,
                            subtitle: adminDashboardController
                                .adminDashboard.value!.teachers
                                .toString(),
                            title: 'Teachers',
                            color: AppColors.kBrown,
                            voidCallbackAction: () {},
                          ),
                  ),
                  Obx(
                    () => adminDashboardController.adminDashboard.value == null
                        ? SelectLoginWidget(
                            image: AppImages.student,
                            subtitle: '0',
                            title: 'Student',
                            color: AppColors.kBlueAFF,
                            voidCallbackAction: () {},
                          )
                        : SelectLoginWidget(
                            image: AppImages.student,
                            subtitle: adminDashboardController
                                .adminDashboard.value!.students
                                .toString(),
                            title: 'Student',
                            color: AppColors.kBlueAFF,
                            voidCallbackAction: () {},
                          ),
                  ),
                  Obx(
                    () => adminDashboardController.adminDashboard.value == null
                        ? SelectLoginWidget(
                            image: AppImages.subcriber,
                            subtitle: '0',
                            title: 'Subscribes',
                            color: AppColors.kLightYellow,
                            voidCallbackAction: () {},
                          )
                        : SelectLoginWidget(
                            image: AppImages.subcriber,
                            subtitle: adminDashboardController
                                .adminDashboard.value!.subscribe
                                .toString(),
                            title: 'Subscribes',
                            color: AppColors.kLightYellow,
                            voidCallbackAction: () {},
                          ),
                  ),
                  Obx(
                    () => adminDashboardController.adminDashboard.value == null
                        ? SelectLoginWidget(
                            image: AppImages.newsFeed,
                            subtitle: '0',
                            title: 'News Feed',
                            color: AppColors.kLightYellow,
                            voidCallbackAction: () {},
                          )
                        : SelectLoginWidget(
                            image: AppImages.newsFeed,
                            subtitle: adminDashboardController
                                .adminDashboard.value!.newsFeed
                                .toString(),
                            title: 'News Feed',
                            color: AppColors.kLightYellow,
                            voidCallbackAction: () {},
                          ),
                  ),
                ],
              ),
      ),
    );
  }
}
