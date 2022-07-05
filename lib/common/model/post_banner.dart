// To parse this JSON data, do
//
//     final postBannerModel = postBannerModelFromJson(jsonString);
/// 首页banner数据
import 'dart:convert';

PostBannerModel postBannerModelFromJson(String str) => PostBannerModel.fromJson(json.decode(str));

String postBannerModelToJson(PostBannerModel data) => json.encode(data.toJson());

class PostBannerModel {
  PostBannerModel({
    required this.data,
    required this.errorCode,
    required this.errorMsg,
  });

  List<BannerModel> data;
  int errorCode;
  String errorMsg;

  factory PostBannerModel.fromJson(Map<String, dynamic> json) => PostBannerModel(
    data: List<BannerModel>.from(json["data"].map((x) => BannerModel.fromJson(x))),
    errorCode: json["errorCode"],
    errorMsg: json["errorMsg"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "errorCode": errorCode,
    "errorMsg": errorMsg,
  };
}

class BannerModel {
  BannerModel({
    required this.desc,
    required this.id,
    required this.imagePath,
    required this.isVisible,
    required this.order,
    required this.title,
    required this.type,
    required this.url,
  });

  String desc;
  int id;
  String imagePath;
  int isVisible;
  int order;
  String title;
  int type;
  String url;

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    desc: json["desc"],
    id: json["id"],
    imagePath: json["imagePath"],
    isVisible: json["isVisible"],
    order: json["order"],
    title: json["title"],
    type: json["type"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "desc": desc,
    "id": id,
    "imagePath": imagePath,
    "isVisible": isVisible,
    "order": order,
    "title": title,
    "type": type,
    "url": url,
  };
}
