// To parse this JSON data, do
//
//     final hotKeyModel = hotKeyModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

HotKeyModel hotKeyModelFromJson(String str) => HotKeyModel.fromJson(json.decode(str));

String hotKeyModelToJson(HotKeyModel data) => json.encode(data.toJson());

class HotKeyModel {
  HotKeyModel({
    required this.data,
    required this.errorCode,
    required this.errorMsg,
  });

  List<HotKey> data;
  int errorCode;
  String errorMsg;

  factory HotKeyModel.fromJson(Map<String, dynamic> json) => HotKeyModel(
    data: List<HotKey>.from(json["data"].map((x) => HotKey.fromJson(x))),
    errorCode: json["errorCode"],
    errorMsg: json["errorMsg"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "errorCode": errorCode,
    "errorMsg": errorMsg,
  };
}

class HotKey {
  HotKey({
    required this.id,
    required this.link,
    required this.name,
    required this.order,
    required this.visible,
  });

  int id;
  String link;
  String name;
  int order;
  int visible;

  factory HotKey.fromJson(Map<String, dynamic> json) => HotKey(
    id: json["id"],
    link: json["link"],
    name: json["name"],
    order: json["order"],
    visible: json["visible"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "link": link,
    "name": name,
    "order": order,
    "visible": visible,
  };
}
