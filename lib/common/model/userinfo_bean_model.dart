// To parse this JSON data, do
//
//     final userinfoBeanModel = userinfoBeanModelFromJson(jsonString);

import 'dart:convert';

import 'z_model.dart';

MeInfoModel userinfoBeanModelFromJson(String str) => MeInfoModel.fromJson(json.decode(str));

String userinfoBeanModelToJson(MeInfoModel data) => json.encode(data.toJson());

class MeInfoModel {
  MeInfoModel({
    required this.data,
    required this.errorCode,
    required this.errorMsg,
  });

  Data data;
  int errorCode;
  String errorMsg;

  factory MeInfoModel.fromJson(Map<String, dynamic> json) => MeInfoModel(
    data: Data.fromJson(json["data"]),
    errorCode: json["errorCode"],
    errorMsg: json["errorMsg"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "errorCode": errorCode,
    "errorMsg": errorMsg,
  };
}

class Data {
  Data({
    required this.coinInfo,
    required this.collectArticleInfo,
  });

  CoinInfo coinInfo;
  CollectArticleInfo collectArticleInfo;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    coinInfo: CoinInfo.fromJson(json["coinInfo"]),
    collectArticleInfo: CollectArticleInfo.fromJson(json["collectArticleInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "coinInfo": coinInfo.toJson(),
    "collectArticleInfo": collectArticleInfo.toJson(),
  };
}

class CollectArticleInfo {
  CollectArticleInfo({
    required this.count,
    required this.erInfo,
  });

  int? count;
  UserInfo erInfo;

  factory CollectArticleInfo.fromJson(Map<String, dynamic> json) => CollectArticleInfo(
    count: json["count"],
    erInfo: UserInfo.fromJson(json["erInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "erInfo": erInfo.toJson(),
  };
}

