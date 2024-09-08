// To parse this JSON data, do
//
//     final adminBursarieModel = adminBursarieModelFromJson(jsonString);

import 'dart:convert';

AdminBursarieModel adminBursarieModelFromJson(String str) =>
    AdminBursarieModel.fromJson(json.decode(str));

String adminBursarieModelToJson(AdminBursarieModel data) =>
    json.encode(data.toJson());

class AdminBursarieModel {
  String? status;
  List<Datum>? data;

  AdminBursarieModel({
    this.status,
    this.data,
  });

  factory AdminBursarieModel.fromJson(Map<String, dynamic> json) =>
      AdminBursarieModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? id;
  String? name;
  String? link;

  Datum({
    this.id,
    this.name,
    this.link,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "link": link,
      };
}
