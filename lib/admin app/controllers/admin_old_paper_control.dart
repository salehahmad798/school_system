import 'dart:async';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;
import 'package:school_system/admin%20app/admin_models/admin_old_paper_model.dart';
import 'package:school_system/services/shearepreference_service.dart';
import 'package:school_system/utils/apis_endpoints.dart';
import 'package:school_system/utils/app_textfields.dart';

import '../admin_models/admin_signin_model.dart';

class MenageOldPaperController extends GetxController {
  RxBool getAdminOldPaper = false.obs;
  RxBool addAdminOldpaperLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    getAdminOldPaperFun();
  }

  var itemImage = Rx<XFile?>(null);
  var itemImageMultipart = Rx<dio.MultipartFile?>(null);

  // Pick Item Image and convert into Multipart file

  Future<void> pickItemImages() async {
    final ImagePicker imagePicker = ImagePicker();
    itemImage.value =
        (await imagePicker.pickImage(source: ImageSource.gallery))!;
    if (itemImage.value != null) {
      String fileName = itemImage.value!.name;
      itemImageMultipart.value = await dio.MultipartFile.fromFile(
        itemImage.value!.path,
        filename: fileName,
      );
    } else {
      Fluttertoast.showToast(msg: "Image Not Added");
    }
    update();
  }

  final Rx<AdminPaperModel?> adminOldPaperModel = Rx<AdminPaperModel?>(null);

  // Loading Function Category
  setLoadingpaper(value) {
    getAdminOldPaper.value = value;
    update();
  }

// Get All category
  getAdminOldPaperFun() async {
    AdminSignInModel user = await ShearedprefService.getUserData();
    setLoadingpaper(true);
    try {
      final response = await dio.Dio()
          .get(
            ApiService.adminGetOldPaper,
            options: dio.Options(
              method: 'GET',
              headers: headersWithToken(user.data!.token),
            ),
          )
          .timeout(const Duration(seconds: 30));
      var mainResult = response.data;
      if (response.statusCode == 200) {
        adminOldPaperModel.value = AdminPaperModel.fromJson(mainResult);
        setLoadingpaper(false);
        update();
      } else {
        Fluttertoast.showToast(msg: "Oops! Dashboard Data not found!!!");
        setLoadingpaper(false);
        update();
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Oops! $e");
      setLoadingpaper(false);
      update();
      return e.toString();
    }
  }

  // Loading Function SignUp
  setLoadingAddAdminUni(value) {
    addAdminOldpaperLoading.value = value;
    update();
  }

  addAdminoldPaperFun() async {
    AdminSignInModel user = await ShearedprefService.getUserData();
    setLoadingAddAdminUni(true);

    var formData = dio.FormData.fromMap({
      'name': AppTextfieldControllers.adminOldPapereName.text,
      'link': 'https://unilink.com.pk/',
      // AppTextfieldControllers.adminOldpaperLink.text,
      'image': itemImageMultipart,
    });
    log(formData.toString());
    try {
      final response = await dio.Dio()
          .post(
            ApiService.adminAddOldPaper,
            data: formData,
            options: dio.Options(
              method: 'POST',
              headers: headersWithToken(user.data!.token),
            ),
          )
          .timeout(const Duration(seconds: 30));

      // print(response.data);
      var mainResult = response.data;
      log('mainResult: $mainResult');
      // var result = response.data;
      if (response.statusCode == 200) {
        Fluttertoast.showToast(
          msg: "Old Paper Added Successfully",
        );
        clearData();
        Get.offAllNamed("/adminBottombar");
        setLoadingAddAdminUni(false);
        update();
      } else {
        Fluttertoast.showToast(msg: "Oops! User not found");
        setLoadingAddAdminUni(false);
        update();
      }
    } catch (e) {
      log('e: $e');
      setLoadingAddAdminUni(false);
      update();
      return e.toString();
    }
  }

  clearData() {
    AppTextfieldControllers.adminOldPapereName.clear();
    AppTextfieldControllers.adminOldpaperLink.clear();
  }
}
