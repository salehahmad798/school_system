// To parse this JSON data, do
//
//     final adminSignInModel = adminSignInModelFromJson(jsonString);

import 'dart:convert';

AdminSignInModel adminSignInModelFromJson(String str) =>
    AdminSignInModel.fromJson(json.decode(str));

String adminSignInModelToJson(AdminSignInModel data) =>
    json.encode(data.toJson());

class AdminSignInModel {
  String? status;
  String? message;
  Data? data;
  Detail? detail;

  AdminSignInModel({
    this.status,
    this.message,
    this.data,
    this.detail,
  });

  factory AdminSignInModel.fromJson(Map<String, dynamic> json) =>
      AdminSignInModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        detail: json["detail"] == null ? null : Detail.fromJson(json["detail"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
        "detail": detail?.toJson(),
      };
}

class Data {
  String? token;

  Data({
    this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}

class Detail {
  int? id;
  String? username;
  String? password;
  String? img;

  Detail({
    this.id,
    this.username,
    this.password,
    this.img,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        id: json["id"],
        username: json["username"],
        password: json["password"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "password": password,
        "img": img,
      };
}
