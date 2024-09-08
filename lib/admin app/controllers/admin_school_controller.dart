import 'dart:developer';
import 'package:dio/dio.dart' as dio;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:school_system/services/shearepreference_service.dart';
import 'package:school_system/utils/app_textfields.dart';
import '../../utils/apis_endpoints.dart';
import '../admin_models/admin_school_model.dart';
import '../admin_models/admin_signin_model.dart';

class AdminSchoolController extends GetxController {
  RxBool adminSchoolBool = false.obs;
  RxBool adminAddSchoolBool = false.obs;

  @override
  void onInit() {
    super.onInit();

    getAdminSchool();
  }

  final Rx<AdminSchoolModel?> adminSchool = Rx<AdminSchoolModel?>(null);

  // Loading Function Category
  setLoadingDashboard(value) {
    adminSchoolBool.value = value;
    update();
  }

// Get All category
  getAdminSchool() async {
    AdminSignInModel user = await ShearedprefService.getUserData();
    log('Token ===${user.data!.token}');
    setLoadingDashboard(true);
    try {
      final response = await dio.Dio()
          .get(
            ApiService.adminschools,
            options: dio.Options(
              method: 'GET',
              headers: headersWithToken(user.data!.token),
            ),
          )
          .timeout(const Duration(seconds: 30));
      var mainResult = response.data;
      log('Main Result = $mainResult');
      if (response.statusCode == 200) {
        adminSchool.value = AdminSchoolModel.fromJson(mainResult);
        log('adminSchool == ${adminSchool.value!.data}');
        setLoadingDashboard(false);
        update();
      } else {
        Fluttertoast.showToast(msg: "Oops! Dashboard Data not found!!!");
        setLoadingDashboard(false);
        update();
      }
    } catch (e) {
      log('e: $e');
      Fluttertoast.showToast(msg: "Oops! $e");
      setLoadingDashboard(false);
      update();
      return e.toString();
    }
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

  // Loading Function SignUp
  setLoadingAddSchool(value) {
    adminAddSchoolBool.value = value;
    update();
  }

  addAdminSchool() async {
    AdminSignInModel user = await ShearedprefService.getUserData();
    log('Token ===${user.data!.token}');
    setLoadingAddSchool(true);

    var formData = dio.FormData.fromMap({
      'name': AppTextfieldControllers.adminschoolName.text,
      // 'link': AppTextfieldControllers.adminSchoolLink.text,
      'image': itemImageMultipart,
    });
    log(formData.toString());
    try {
      final response = await dio.Dio()
          .post(
            ApiService.adminAddSchool,
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
          msg: "School Added Successfully",
        );
        // ShearedprefService.saveUserData(mainResult);
        log('in saveUserData');

        // ShearedprefService.setUserLoggedIn(true);
        clearData();
        Get.offAllNamed("/adminBottombar");
        setLoadingAddSchool(false);
        update();
      } else {
        Fluttertoast.showToast(msg: "Oops! User not found");
        setLoadingAddSchool(false);
        update();
      }
    } catch (e) {
      log('e: $e');
      setLoadingAddSchool(false);
      update();
      return e.toString();
    }
  }

  clearData() {
    // Admin School Clear data
    AppTextfieldControllers.adminSchoolLink.clear();
    AppTextfieldControllers.adminschoolName.clear();
    update();
  }
}
