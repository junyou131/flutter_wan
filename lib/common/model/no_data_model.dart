// To parse this JSON data, do
//
//     final noDataModel = noDataModelFromJson(jsonString);

import 'dart:convert';

NoDataModel noDataModelFromJson(String str) => NoDataModel.fromJson(json.decode(str));

String noDataModelToJson(NoDataModel data) => json.encode(data.toJson());

class NoDataModel {
  NoDataModel({
    required this.data,
    required this.errorCode,
    required this.errorMsg,
  });

  dynamic? data;
  int errorCode;
  String errorMsg;

  factory NoDataModel.fromJson(Map<String, dynamic> json) => NoDataModel(
    data: json["data"],
    errorCode: json["errorCode"],
    errorMsg: json["errorMsg"],
  );

  Map<String, dynamic> toJson() => {
    "data": data,
    "errorCode": errorCode,
    "errorMsg": errorMsg,
  };
}
