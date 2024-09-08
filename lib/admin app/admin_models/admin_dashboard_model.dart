// To parse this JSON data, do
//
//     final adminDashboardModel = adminDashboardModelFromJson(jsonString);

import 'dart:convert';

AdminDashboardModel adminDashboardModelFromJson(String str) =>
    AdminDashboardModel.fromJson(json.decode(str));

String adminDashboardModelToJson(AdminDashboardModel data) =>
    json.encode(data.toJson());

class AdminDashboardModel {
  int? teachers;
  int? students;
  int? subscribe;
  int? newsFeed;

  AdminDashboardModel({
    this.teachers,
    this.students,
    this.subscribe,
    this.newsFeed,
  });

  factory AdminDashboardModel.fromJson(Map<String, dynamic> json) =>
      AdminDashboardModel(
        teachers: json["teachers"],
        students: json["students"],
        subscribe: json["subscribe"],
        newsFeed: json["news_feed"],
      );

  Map<String, dynamic> toJson() => {
        "teachers": teachers,
        "students": students,
        "subscribe": subscribe,
        "news_feed": newsFeed,
      };
}
