// To parse this JSON data, do
//
//     final adminSchoolModel = adminSchoolModelFromJson(jsonString);

import 'dart:convert';

AdminSchoolModel adminSchoolModelFromJson(String str) =>
    AdminSchoolModel.fromJson(json.decode(str));

String adminSchoolModelToJson(AdminSchoolModel data) =>
    json.encode(data.toJson());

class AdminSchoolModel {
  String? status;
  List<SingleSchool>? data;

  AdminSchoolModel({
    this.status,
    this.data,
  });

  factory AdminSchoolModel.fromJson(Map<String, dynamic> json) =>
      AdminSchoolModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<SingleSchool>.from(json["data"]!.map((x) => SingleSchool.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class SingleSchool {
  int? id;
  String? name;
  String? link;
  String? image;

  SingleSchool({
    this.id,
    this.name,
    this.link,
    this.image,
  });

  factory SingleSchool.fromJson(Map<String, dynamic> json) => SingleSchool(
        id: json["id"],
        name: json["name"],
        link: json["link"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "link": link,
        "image": image,
      };
}
