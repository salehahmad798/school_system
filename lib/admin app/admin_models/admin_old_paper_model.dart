// To parse this JSON data, do
//
//     final adminPaperModel = adminPaperModelFromJson(jsonString);

import 'dart:convert';

AdminPaperModel adminPaperModelFromJson(String str) =>
    AdminPaperModel.fromJson(json.decode(str));

String adminPaperModelToJson(AdminPaperModel data) =>
    json.encode(data.toJson());

class AdminPaperModel {
  String? status;
  List<SinglePaper>? data;

  AdminPaperModel({
    this.status,
    this.data,
  });

  factory AdminPaperModel.fromJson(Map<String, dynamic> json) =>
      AdminPaperModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<SinglePaper>.from(json["data"]!.map((x) => SinglePaper.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class SinglePaper {
  int? id;
  String? name;
  String? link;
  String? image;

  SinglePaper({
    this.id,
    this.name,
    this.link,
    this.image,
  });

  factory SinglePaper.fromJson(Map<String, dynamic> json) => SinglePaper(
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
