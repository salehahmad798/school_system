
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../admin app/admin_models/admin_signin_model.dart';



class ShearedprefService {
  static late SharedPreferences shearedPrefs;
  static bool _initialized = false;

  static Future<void> _initialize() async {
    shearedPrefs = await SharedPreferences.getInstance();
  }

  static Future<void> initialize() async {
    if (!_initialized) {
      await _initialize();
      _initialized = true;
    }
  }

  //set  user Logged
  static Future<void> setUserLoggedIn(bool value) async {
    if (!_initialized) {
      await initialize();
    }
    await shearedPrefs.setBool('userLoggedIn', value);
  }

  //get user Logged
  static bool getUserLoggedIn() {
    bool isLogin = false;
    if (!_initialized) {
      throw Exception("ShearedprefService is not initialized");
    }
    isLogin = shearedPrefs.getBool('userLoggedIn') ?? false;
    return isLogin;
  }

  //set  user Accestoken
  static Future<void> setUserID(String value) async {
    if (!_initialized) {
      await initialize();
    }
    await shearedPrefs.setString('userAccessToken', value);
  }

  //get user Accestoken
  static String? getUserID() {
    if (!_initialized) {
      throw Exception("ShearedprefService is not initialized");
    }
    return shearedPrefs.getString('userAccessToken');
  }

  //set  user Gmail
  static Future<void> setUserGmail(String value) async {
    if (!_initialized) {
      await initialize();
    }
    await shearedPrefs.setString('userGmail', value);
  }

  //get user Gmail
  static String? getUserGmail() {
    if (!_initialized) {
      throw Exception("ShearedprefService is not initialized");
    }
    return shearedPrefs.getString('userGmail');
  }

  //set  intro Screen
  static Future<void> setintroScreen(bool value) async {
    if (!_initialized) {
      await initialize();
    }
    await shearedPrefs.setBool('introScreen', value);
  }

  //get intro Screen
  static bool? getintroScreen() {
    if (!_initialized) {
      throw Exception("ShearedprefService is not initialized");
    }
    return shearedPrefs.getBool('introScreen');
  }

  static Future<bool> logoutAccount() {
    if (!_initialized) {
      throw Exception("ShearedprefService is not initialized");
    }
    var res = shearedPrefs.clear();
    return res;
  }

  static saveUserData(data) async {
    String userJson = jsonEncode(data);
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('userData', userJson);
  }

  static getUserData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var userRaw = pref.getString("userData");
    if (userRaw != null) {
      var user =
          AdminSignInModel.fromJson(jsonDecode(userRaw) as Map<String, dynamic>);
      return user;
    } else {
      return null;
    }
  }
}
