import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeacherController {
  // Student Log in Data
  static final TextEditingController teacherSignInEmail =
      TextEditingController();
  static final TextEditingController teacherSignInPassword =
      TextEditingController();

  //Student signup Data
  static final TextEditingController firstName = TextEditingController();
  static final TextEditingController lastName = TextEditingController();
  static final TextEditingController emailAddress = TextEditingController();
  static final TextEditingController contact = TextEditingController();
  static final TextEditingController password = TextEditingController();
  static final TextEditingController confirmPassword = TextEditingController();
  static final TextEditingController courseCode = TextEditingController();
}

class TeacherAuth extends GetxController {
  RxBool check = false.obs;

  void onCheck(bool? value) {
    if (value != null) {
      check.value = value;
    }
  }
}
