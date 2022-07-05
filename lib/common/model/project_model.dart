// To parse this JSON data, do
//
//     final projectModel = projectModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProjectModel projectModelFromJson(String str) => ProjectModel.fromJson(json.decode(str));

String projectModelToJson(ProjectModel data) => json.encode(data.toJson());

class ProjectModel {
  ProjectModel({
    required this.data,
    required this.errorCode,
    required this.errorMsg,
  });

  List<ProjectInfo> data;
  int errorCode;
  String errorMsg;

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
    data: List<ProjectInfo>.from(json["data"].map((x) => ProjectInfo.fromJson(x))),
    errorCode: json["errorCode"],
    errorMsg: json["errorMsg"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "errorCode": errorCode,
    "errorMsg": errorMsg,
  };
}

class ProjectInfo {
  ProjectInfo({
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
  List<dynamic> children;
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

  factory ProjectInfo.fromJson(Map<String, dynamic> json) => ProjectInfo(
    author: json["author"],
    children: List<dynamic>.from(json["children"].map((x) => x)),
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
    "children": List<dynamic>.from(children.map((x) => x)),
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
