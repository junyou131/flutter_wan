import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wan/common/route/app_routes.dart';
import 'package:flutter_wan/common/utils/z_utils.dart';
import 'package:get/get.dart';

import '../../common/model/userinfo_bean_model.dart';
import '../../common/model/z_model.dart';
import '../../common/provider/common_provider.dart';
import '../../common/res/z_res.dart';
import '../../common/service/z_service.dart';

class TagItem {
  Widget icon;
  Widget label;

  TagItem({required this.icon, required this.label});
}

class MeLogic extends GetxController {
  var provider = Get.find<CommonProvider>();
  var isLogin = UserStore.instance.isLogin;
  String nickname = '';
  UserInfo? userInfo;
  CoinInfo? coinInfo;
  var tags = [];
  final titles = ['点赞', '收藏', '评论'];

  @override
  void onInit() {
    printLog("MeLogic:onInit");
    super.onInit();
  }

  @override
  void onReady() {
    printLog("MeLogic:onReady");
    getUserInfo();
    super.onReady();
  }

  void getUserInfo() async {
    var response = await provider.getUserinfo();
    print("返回用户信息:${response.body}");
    coinInfo = MeInfoModel.fromJson(response.body).data.coinInfo;
    userInfo =
        MeInfoModel.fromJson(response.body).data.collectArticleInfo.erInfo;
    nickname = userInfo!.nickname;
    update(['title']);
    initTags();
    update(['info']);
  }

  void toSetting() {
    AppRoutes.toPage(AppRoutes.meSetting);
  }

  void initTags() {
    tags.clear();
    tags.add(TagItem(
        icon: const Icon(Icons.collections_bookmark_outlined,
            color: ColorRes.white),
        label: Text(
          '等级(${coinInfo?.level ?? '0'})',
          style: TextStyle(color: ColorRes.white, fontSize: 12.sp),
        )));
    tags.add(
      TagItem(
          icon: const Icon(Icons.favorite, color: ColorRes.white),
          label: Text(
            '积分(${userInfo?.coinCount ?? '0'})',
            style: TextStyle(color: ColorRes.white, fontSize: 12.sp),
          )),
    );
    tags.add(TagItem(
        icon: const Icon(Icons.comment, color: ColorRes.white),
        label: Text(
          '收藏(${userInfo?.collectIds.length ?? '0'})',
          style: TextStyle(color: ColorRes.white, fontSize: 12.sp),
        )));
  }

  logout() {}
}
