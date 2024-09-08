import 'dart:developer';
import 'package:dio/dio.dart' as dio;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:school_system/services/shearepreference_service.dart';
import 'package:school_system/utils/app_textfields.dart';

import '../../utils/apis_endpoints.dart';
import '../admin_models/admin_signin_model.dart';

class AuthenticationController extends GetxController {
  RxBool sinUpBool = false.obs;
  RxBool sinINBool = false.obs;
  RxBool passchange = false.obs;

  // Loading Function SignUp
  setLoadingSignIN(value) {
    sinINBool.value = value;
    update();
  }

  signInUser() async {
    setLoadingSignIN(true);

    var formData = dio.FormData.fromMap({
      'username': AppTextfieldControllers.adminSignInEmail.text,
      'password': AppTextfieldControllers.adminSignInPassword.text,
    });
    log(formData.toString());
    try {
      final response = await dio.Dio()
          .post(
            ApiService.adminLogin,
            data: formData,
            options: dio.Options(headers: headers),
          )
          .timeout(const Duration(seconds: 30));

      // print(response.data);
      var mainResult = response.data;
      // log('mainResult: ${mainResult}');
      // var result = response.data;
      if (response.statusCode == 200) {
        log(response.data.toString());
        AdminSignInModel user = AdminSignInModel.fromJson(mainResult);
        // UserModel userModel = userModelFromMap(response.data.toString());
        // Data data = Data.fromMap(mainResult['data']);
        // log(user.message);
        log('user  address === ${user.detail!.username.toString()}');
        // log('response $result');
        Fluttertoast.showToast(
          msg: "User LogedIn Successfully",
        );
        ShearedprefService.saveUserData(mainResult);
        log('in saveUserData');

        ShearedprefService.setUserLoggedIn(true);
        clearData();
            Get.offAllNamed("/adminBottombar");
        setLoadingSignIN(false);
        update();
      } else {
        Fluttertoast.showToast(msg: "Oops! User not found");
        setLoadingSignIN(false);
        update();
      }
    } catch (e) {
      log('e: $e');
      setLoadingSignIN(false);
      update();
      return e.toString();
    }
  }

  clearData() {
    // SignUp Clear data
    AppTextfieldControllers.adminSignInEmail.clear();
    AppTextfieldControllers.adminSignInPassword.clear();
    update();
  }
}
