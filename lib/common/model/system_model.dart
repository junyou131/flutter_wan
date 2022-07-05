// To parse this JSON data, do
//
//     final systemModel = systemModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SystemModel systemModelFromJson(String str) => SystemModel.fromJson(json.decode(str));

String systemModelToJson(SystemModel data) => json.encode(data.toJson());

class SystemModel {
  SystemModel({
    required this.data,
    required this.errorCode,
    required this.errorMsg,
  });

  List<SystemInfo> data;
  int errorCode;
  String errorMsg;

  factory SystemModel.fromJson(Map<String, dynamic> json) => SystemModel(
    data: List<SystemInfo>.from(json["data"].map((x) => SystemInfo.fromJson(x))),
    errorCode: json["errorCode"],
    errorMsg: json["errorMsg"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "errorCode": errorCode,
    "errorMsg": errorMsg,
  };
}

class SystemInfo {
  SystemInfo({
    required this.author,
    required this.children,
    required this.courseId,
    required this.cover,
    required this.desc,
    required this.id,
    required this.lisense,
    required this.lisenseLink,
    required this.name,
    required this.order,
    required this.parentChapterId,
    required this.userControlSetTop,
    required this.visible,
  });

  String author;
  List<SystemInfo> children;
  int courseId;
  String cover;
  String desc;
  int id;
  String lisense;
  String lisenseLink;
  String name;
  int order;
  int parentChapterId;
  bool userControlSetTop;
  int visible;

  factory SystemInfo.fromJson(Map<String, dynamic> json) => SystemInfo(
    author: json["author"],
    children: List<SystemInfo>.from(json["children"].map((x) => SystemInfo.fromJson(x))),
    courseId: json["courseId"],
    cover: json["cover"],
    desc: json["desc"],
    id: json["id"],
    lisense: json["lisense"],
    lisenseLink: json["lisenseLink"],
    name: json["name"],
    order: json["order"],
    parentChapterId: json["parentChapterId"],
    userControlSetTop: json["userControlSetTop"],
    visible: json["visible"],
  );

  Map<String, dynamic> toJson() => {
    "author": author,
    "children": List<dynamic>.from(children.map((x) => x.toJson())),
    "courseId": courseId,
    "cover": cover,
    "desc": desc,
    "id": id,
    "lisense": lisense,
    "lisenseLink": lisenseLink,
    "name": name,
    "order": order,
    "parentChapterId": parentChapterId,
    "userControlSetTop": userControlSetTop,
    "visible": visible,
  };
}
