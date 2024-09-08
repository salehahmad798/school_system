// To parse this JSON data, do
//
//     final adminUniversityModel = adminUniversityModelFromJson(jsonString);

import 'dart:convert';

AdminUniversityModel adminUniversityModelFromJson(String str) =>
    AdminUniversityModel.fromJson(json.decode(str));

String adminUniversityModelToJson(AdminUniversityModel data) =>
    json.encode(data.toJson());

class AdminUniversityModel {
  String? status;
  List<SingleUniversity>? data;

  AdminUniversityModel({
    this.status,
    this.data,
  });

  factory AdminUniversityModel.fromJson(Map<String, dynamic> json) =>
      AdminUniversityModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<SingleUniversity>.from(json["data"]!.map((x) => SingleUniversity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class SingleUniversity {
  int? id;
  String? name;
  String? link;
  String? image;

  SingleUniversity({
    this.id,
    this.name,
    this.link,
    this.image,
  });

  factory SingleUniversity.fromJson(Map<String, dynamic> json) => SingleUniversity(
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
