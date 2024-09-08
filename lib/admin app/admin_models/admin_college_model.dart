// To parse this JSON data, do
//
//     final adminCollegeModel = adminCollegeModelFromJson(jsonString);

import 'dart:convert';

AdminCollegeModel adminCollegeModelFromJson(String str) =>
    AdminCollegeModel.fromJson(json.decode(str));

String adminCollegeModelToJson(AdminCollegeModel data) =>
    json.encode(data.toJson());

class AdminCollegeModel {
  String? status;
  List<SinglCollege>? data;

  AdminCollegeModel({
    this.status,
    this.data,
  });

  factory AdminCollegeModel.fromJson(Map<String, dynamic> json) =>
      AdminCollegeModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<SinglCollege>.from(json["data"]!.map((x) => SinglCollege.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class SinglCollege {
  int? id;
  String? name;
  String? link;
  String? image;

  SinglCollege({
    this.id,
    this.name,
    this.link,
    this.image,
  });

  factory SinglCollege.fromJson(Map<String, dynamic> json) => SinglCollege(
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
