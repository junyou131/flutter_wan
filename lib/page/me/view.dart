import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wan/common/widget/atos_water_view.dart';
import 'package:flutter_wan/page/me/logic.dart';
import 'package:get/get.dart';

import '../../common/res/z_res.dart';

class MePage extends GetView<MeLogic> {
  final logic = Get.find<MeLogic>();
  GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GetBuilder<MeLogic>(
          id: 'title',
          builder: (logic) => Text(logic.nickname),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => _toSetting(), icon: const Icon(Icons.settings))
        ],
      ),
      body: Padding(
        padding:
            EdgeInsets.only(left: 5.w, top: 30.h, right: 5.w, bottom: 10.h),
        child: Column(
          children: [_buildIcon(), _buildAtosWidget(), _buildLogoutButton()],
        ),
      ),
    );
  }

  /// 添加头像/收藏等
  _buildIcon() {
    return Container(
      height: 90.w,
      alignment: Alignment.center,
      child: Stack(
        children: [
          Container(
              height: 80.w,
              width: ScreenUtil.defaultSize.width,
              margin: EdgeInsets.only(left: 50.w, right: 10.w),
              padding: EdgeInsets.only(
                left: 40.w,
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Colors.purple.shade200, blurRadius: 3.r)
                ],
                borderRadius: BorderRadius.circular(3.r),
              ),
              child: GetBuilder<MeLogic>(
                id: 'info',
                builder: (logic) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _buildTagLayout()),
              )),
          Container(
            width: 80.w,
            height: 80.w,
            margin: EdgeInsets.only(left: 10.w),
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: ColorRes.purple, blurRadius: 5.r)],
              color: Colors.white,
              borderRadius: BorderRadius.circular(40.w),
            ),
            child: CircleAvatar(
                radius: 40.w,
                foregroundColor: ColorRes.purple,
                child: CachedNetworkImage(
                    color: ColorRes.white,
                    imageUrl:
                        'https://www.wanandroid.com/resources/image/pc/logo.png',
                    width: 80.w,
                    height: 80.w)),
          ),
        ],
      ),
    );
  }

  _buildTagLayout() {
    return logic.tags
        .map((e) => Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  e.icon,
                  e.label,
                ],
              ),
            ))
        .toList();
  }

  _toSetting() {

    controller.toSetting();
  }

  _buildAtosWidget() {
    return AtosWaterView(
      key: _globalKey,
      width: ScreenUtil.defaultSize.width,
      height: 300.h,
      ballCount: 11,
      callback: (value) {
        GetSnackBar(
          message: '当前点击小球Y坐标：$value',
          duration: const Duration(seconds: 2),
        ).show();
      },
    );
  }

  _buildLogoutButton() {
    return Container(
      width: ScreenUtil.defaultSize.width,
      margin: EdgeInsets.only(top: 20.h),
      height: 40.h,
      child: ElevatedButton(
        onPressed: () => {logic.logout()},
        child: Text(StringRes.logout.tr),
      ),
    );
  }
}
