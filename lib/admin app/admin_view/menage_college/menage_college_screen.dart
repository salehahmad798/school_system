import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_system/admin%20app/admin_view/menage_school.dart/add_admin_school.dart';
import 'package:school_system/admin%20app/controllers/admin_college_controller.dart';
import 'package:school_system/utils/app_color.dart';
import 'package:school_system/utils/app_custom_text_style.dart';
import 'package:school_system/utils/app_images.dart';
import 'package:school_system/widgets/app_custom_buttons.dart';
import 'package:school_system/widgets/menage_insitute_widget.dart';
import '../../../widgets/App_custom_text.dart';
import '../../admin_models/admin_college_model.dart';

class MenageCollegeScreen extends StatelessWidget {
  MenageCollegeScreen({super.key});

  final MenageCollegeController adminCollegeController =
      Get.put(MenageCollegeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kPrimary,
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
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            padding: const EdgeInsets.all(0),
                            icon: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: AppColors.kWhite,
                            ),
                          ),
                          CustomText(
                            text: 'Manage College',
                            textStyle: AppTextStyles().heading(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                textColor: AppColors.kWhite),
                          )
                        ],
                      ),
                      Obx(() =>
                          adminCollegeController.adminCollegeModel.value == null
                              ? const SizedBox()
                              : Padding(
                                  padding: const EdgeInsets.only(
                                      top: 31.0, bottom: 15),
                                  child: CustomText(
                                    text:
                                        'All University (${adminCollegeController.adminCollegeModel.value!.data!.length})',
                                    textStyle: AppTextStyles().heading(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        textColor: AppColors.kWhite),
                                  ),
                                )),
                      Padding(
                        padding: const EdgeInsets.only(top: 31.0, bottom: 15),
                        child: CustomText(
                          text: 'All College (3)',
                          textStyle: AppTextStyles().heading(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              textColor: AppColors.kWhite),
                        ),
                      )
                    ],
                  ),
                )),
            Expanded(
              child: Container(
                  // height: MediaQuery.of(context).size.height * 0.3,
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
                          PrimaryButton(
                            text: 'Manage College',
                            function: () {
                              Get.to(() => AddAdminSchoolScrenn());
                            },
                            color: AppColors.noColor,
                            tcolor: AppColors.kPrimary,
                            width: Get.width,
                          ),
                          Obx(
                            () => adminCollegeController.getAdminCollege.value
                                ? const CircularProgressIndicator()
                                : ListView.builder(
                                    itemCount: adminCollegeController
                                                .adminCollegeModel.value ==
                                            null
                                        ? 0
                                        : adminCollegeController
                                            .adminCollegeModel
                                            .value!
                                            .data!
                                            .length,
                                    // reverse: true,
                                    // scrollDirection: Axis.vertical,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      SinglCollege singleUni =
                                          adminCollegeController
                                              .adminCollegeModel
                                              .value!
                                              .data![index];
                                      return MenageInsituteWidget(
                                        image: singleUni.image.toString(),
                                        insituteName: singleUni.name.toString(),
                                        title: 'College name',
                                        link: singleUni.link == null
                                            ? ''
                                            : singleUni.link.toString(),
                                        ontap: () {
                                          log('Ahmad');
                                        },
                                      );
                                    },
                                  ),
                          ),
                          MenageInsituteWidget(
                            image: '',
                            insituteName: 'Northern high college',
                            title: 'College name',
                            link: "www.northerncollege.com",
                            ontap: () {
                              log('Ahmad');
                            },
                          ),
                          MenageInsituteWidget(
                            image: '',
                            insituteName: 'Northern high college',
                            title: 'College name',
                            link: "www.northerncollege.com",
                            ontap: () {
                              log('Ahmad');
                            },
                          ),
                          MenageInsituteWidget(
                            image: '',
                            insituteName: 'Northern high college',
                            title: 'College name',
                            link: "www.northerncollege.com",
                            ontap: () {
                              log('Ahmad');
                            },
                          ),
                          MenageInsituteWidget(
                            image: '',
                            insituteName: 'Northern high college',
                            title: 'College name',
                            link: "www.northerncollege.com",
                            ontap: () {
                              log('Ahmad');
                            },
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          ],
        ));
  }
}
