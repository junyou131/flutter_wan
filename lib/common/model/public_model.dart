// To parse this JSON data, do
//
//     final publicModel = publicModelFromJson(jsonString);

import 'dart:convert';

PublicModel publicModelFromJson(String str) => PublicModel.fromJson(json.decode(str));

String publicModelToJson(PublicModel data) => json.encode(data.toJson());

class PublicModel {
  PublicModel({
    required this.data,
    required this.errorCode,
    required this.errorMsg,
  });

  List<PublicBean> data;
  int errorCode;
  String errorMsg;

  factory PublicModel.fromJson(Map<String, dynamic> json) => PublicModel(
    data: List<PublicBean>.from(json["data"].map((x) => PublicBean.fromJson(x))),
    errorCode: json["errorCode"],
    errorMsg: json["errorMsg"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "errorCode": errorCode,
    "errorMsg": errorMsg,
  };
}

class PublicBean {
  PublicBean({
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

  factory PublicBean.fromJson(Map<String, dynamic> json) => PublicBean(
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
