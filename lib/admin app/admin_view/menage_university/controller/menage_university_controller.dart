import 'dart:async';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;
import 'package:school_system/services/shearepreference_service.dart';
import 'package:school_system/utils/apis_endpoints.dart';
import 'package:school_system/utils/app_textfields.dart';

import '../../../admin_models/admin_signin_model.dart';
import '../../../admin_models/admin_university_model.dart';

class MenageUniversityController extends GetxController {
  RxBool addAdminUniversity = false.obs;
  RxBool addAdminUniversityLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    getAdminUniversity();
  }

 
  var itemImage = Rx<XFile?>(null);
  var itemImageMultipart = Rx<dio.MultipartFile?>(null);

  // Pick Item Image and convert into Multipart file

  Future<void> pickItemImages() async {
    log('in fun');
    final ImagePicker imagePicker = ImagePicker();
    itemImage.value =
        (await imagePicker.pickImage(source: ImageSource.gallery))!;
    log('Image Picked');
    log(itemImage.value!.path.toString());
    if (itemImage.value != null) {
      log('update image = ${itemImage.value!.path}');

      String fileName = itemImage.value!.name;
      itemImageMultipart.value = await dio.MultipartFile.fromFile(
        itemImage.value!.path,
        filename: fileName,
      );
      log('itemImageMultipart === ${itemImageMultipart.value!.filename}');
      update();
    } else {
      log('message');
      Fluttertoast.showToast(msg: "Image Not Added");
    }
    update();
  }

  final Rx<AdminUniversityModel?> adminUniversityModel =
      Rx<AdminUniversityModel?>(null);

  // Loading Function Category
  setLoadingUniversity(value) {
    addAdminUniversity.value = value;
    update();
  }

// Get All category
  getAdminUniversity() async {
    AdminSignInModel user = await ShearedprefService.getUserData();
    log('Token ===${user.data!.token}');
    setLoadingUniversity(true);
    try {
      final response = await dio.Dio()
          .get(
            ApiService.adminGetUniversity,
            options: dio.Options(
              method: 'GET',
              headers: headersWithToken(user.data!.token),
            ),
          )
          .timeout(const Duration(seconds: 30));
      var mainResult = response.data;
      log('Main Result = $mainResult');
      if (response.statusCode == 200) {
        adminUniversityModel.value = AdminUniversityModel.fromJson(mainResult);
        log('adminUniversityModel == ${adminUniversityModel.value!.data}');
        setLoadingUniversity(false);
        update();
      } else {
        Fluttertoast.showToast(msg: "Oops! Dashboard Data not found!!!");
        setLoadingUniversity(false);
        update();
      }
    } catch (e) {
      log('e: $e');
      Fluttertoast.showToast(msg: "Oops! $e");
      setLoadingUniversity(false);
      update();
      return e.toString();
    }
  }

  // Loading Function SignUp
  setLoadingAddAdminUni(value) {
    addAdminUniversityLoading.value = value;
    update();
  }

  addAdminUniversityFun() async {
    AdminSignInModel user = await ShearedprefService.getUserData();
    log('Token ===${user.data!.token}');
    setLoadingAddAdminUni(true);

    var formData = dio.FormData.fromMap({
      'name': AppTextfieldControllers.adminUniName.text,
      // 'link': AppTextfieldControllers.adminSchoolLink.text,
      'image': itemImageMultipart,
    });
    log(formData.toString());
    try {
      final response = await dio.Dio()
          .post(
            ApiService.adminAddUniversity,
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
        // log(response.data.toString());
        // AdminSignInModel user = AdminSignInModel.fromJson(mainResult);
        // UserModel userModel = userModelFromMap(response.data.toString());
        // Data data = Data.fromMap(mainResult['data']);
        // log(user.message);
        // log('user  address === ${user.detail!.username.toString()}');
        // log('response $result');
        Fluttertoast.showToast(
          msg: "University Added Successfully",
        );
        // ShearedprefService.saveUserData(mainResult);
        log('in saveUserData');

        // ShearedprefService.setUserLoggedIn(true);
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
    // AppTextfieldControllers.clear();
    // AppTextfieldControllers.catItemDescriptionController.clear();
    // AppTextfieldControllers.catItemPriceController.clear();
    // extraitemAddONCheckList.clear();
    // extraitemAddOnQuantityList.clear();
  }
}
