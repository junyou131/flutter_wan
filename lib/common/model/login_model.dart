// To parse this JSON data, do
//
//     final userInfoModel = userInfoModelFromJson(jsonString);

import 'dart:convert';

UserInfoModel userInfoModelFromJson(String str) => UserInfoModel.fromJson(json.decode(str));

String userInfoModelToJson(UserInfoModel data) => json.encode(data.toJson());

class UserInfoModel {
  UserInfoModel({
    required this.data,
    required this.errorCode,
    required this.errorMsg,
  });

  Data data;
  int errorCode;
  String errorMsg;

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
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
    required this.info,
  });

  CoinInfo coinInfo;
  UserInfo info;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    coinInfo: CoinInfo.fromJson(json["coinInfo"]),
    info: UserInfo.fromJson(json["userInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "coinInfo": coinInfo.toJson(),
    "Info": info.toJson(),
  };
}

class CoinInfo {
  CoinInfo({
    required this.coinCount,
    required this.level,
    required this.nickname,
    required this.rank,
    required this.userId,
    required this.username,
  });

  int coinCount;
  int level;
  String nickname;
  String rank;
  int userId;
  String username;

  factory CoinInfo.fromJson(Map<String, dynamic> json) => CoinInfo(
    coinCount: json["coinCount"],
    level: json["level"],
    nickname: json["nickname"],
    rank: json["rank"],
    userId: json["userId"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "coinCount": coinCount,
    "level": level,
    "nickname": nickname,
    "rank": rank,
    "userId": userId,
    "username": username,
  };
}

class UserInfo {
  UserInfo({
    required this.admin,
    required this.chapterTops,
    required this.coinCount,
    required this.collectIds,
    required this.email,
    required this.icon,
    required this.id,
    required this.nickname,
    required this.password,
    required this.publicName,
    required this.token,
    required this.type,
    required this.username,
  });

  bool admin;
  List<dynamic> chapterTops;
  int coinCount;
  List<dynamic> collectIds;
  String email;
  String icon;
  int id;
  String nickname;
  String password;
  String publicName;
  String token;
  int type;
  String username;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    admin: json["admin"],
    chapterTops: List<dynamic>.from(json["chapterTops"].map((x) => x)),
    coinCount: json["coinCount"],
    collectIds: List<dynamic>.from(json["collectIds"].map((x) => x)),
    email: json["email"],
    icon: json["icon"],
    id: json["id"],
    nickname: json["nickname"],
    password: json["password"],
    publicName: json["publicName"],
    token: json["token"],
    type: json["type"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "admin": admin,
    "chapterTops": List<dynamic>.from(chapterTops.map((x) => x)),
    "coinCount": coinCount,
    "collectIds": List<dynamic>.from(collectIds.map((x) => x)),
    "email": email,
    "icon": icon,
    "id": id,
    "nickname": nickname,
    "password": password,
    "publicName": publicName,
    "token": token,
    "type": type,
    "username": username,
  };
}
