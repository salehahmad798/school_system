import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_system/admin%20app/admin_models/admin_old_paper_model.dart';
import 'package:school_system/utils/app_color.dart';
import 'package:school_system/utils/app_custom_text_style.dart';
import 'package:school_system/widgets/app_custom_buttons.dart';
import 'package:school_system/widgets/menage_insitute_widget.dart';
import '../../../widgets/App_custom_text.dart';
import '../../controllers/admin_old_paper_control.dart';
import 'add_admin_old_paper.dart';

class MenageOldPaperScreen extends StatelessWidget {
  MenageOldPaperScreen({super.key});

  final MenageOldPaperController adminOldPaperController =
      Get.put(MenageOldPaperController());

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
                            text: 'Manage Paper',
                            textStyle: AppTextStyles().heading(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                textColor: AppColors.kWhite),
                          )
                        ],
                      ),
                      Obx(() => adminOldPaperController
                                  .adminOldPaperModel.value ==
                              null
                          ? const SizedBox()
                          : Padding(
                              padding:
                                  const EdgeInsets.only(top: 31.0, bottom: 15),
                              child: CustomText(
                                text:
                                    'All Papers (${adminOldPaperController.adminOldPaperModel.value!.data!.length})',
                                textStyle: AppTextStyles().heading(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    textColor: AppColors.kWhite),
                              ),
                            )),
                      Padding(
                        padding: const EdgeInsets.only(top: 31.0, bottom: 15),
                        child: CustomText(
                          text: 'All University (3)',
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
                            text: 'Add Paper',
                            function: () {
                              Get.to(() => AddAminOldPerScreen());
                            },
                            color: AppColors.noColor,
                            tcolor: AppColors.kPrimary,
                            width: Get.width,
                          ),
                          Obx(
                            () => adminOldPaperController.getAdminOldPaper.value
                                ? const CircularProgressIndicator()
                                : ListView.builder(
                                    itemCount: adminOldPaperController
                                                .adminOldPaperModel.value ==
                                            null
                                        ? 0
                                        : adminOldPaperController
                                            .adminOldPaperModel
                                            .value!
                                            .data!
                                            .length,
                                    // reverse: true,
                                    // scrollDirection: Axis.vertical,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      SinglePaper singlePap =
                                          adminOldPaperController
                                              .adminOldPaperModel
                                              .value!
                                              .data![index];
                                      return MenageInsituteWidget(
                                        image: singlePap.image.toString(),
                                        insituteName: singlePap.name.toString(),
                                        title: 'Paper Details',
                                        link: singlePap.link == null
                                            ? ''
                                            : singlePap.link.toString(),
                                        ontap: () {
                                          log('Ahmad');
                                        },
                                      );
                                    },
                                  ),
                          ),
                          MenageInsituteWidget(
                            image: "",
                            insituteName: 'University of the Witwatersrand',
                            title: 'University name',
                            link: "www.wits.ac.za",
                            ontap: () {
                              log('Ahmad');
                            },
                          ),
                          MenageInsituteWidget(
                            image: "",
                            insituteName: 'University of the Witwatersrand',
                            title: 'University name',
                            link: "www.wits.ac.za",
                            ontap: () {
                              log('Ahmad');
                            },
                          ),
                          MenageInsituteWidget(
                            image: "",
                            insituteName: 'University of the Witwatersrand',
                            title: 'University name',
                            link: "www.wits.ac.za",
                            ontap: () {
                              log('Ahmad');
                            },
                          ),
                          MenageInsituteWidget(
                            image: "",
                            insituteName: 'University of the Witwatersrand',
                            title: 'University name',
                            link: "www.wits.ac.za",
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
