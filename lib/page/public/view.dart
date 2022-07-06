import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wan/common/widget/base_scaffold.dart';
import 'package:get/get.dart';

import '../../common/model/z_model.dart';
import '../../common/res/z_res.dart';
import 'logic.dart';

class PublicPage extends GetView<PublicLogic> {
  final logic = Get.put(PublicLogic());
  final random = Random();

  @override
  Widget build(BuildContext context) {
    return commonScaffold(
        title: StringRes.tabThePublic.tr,
        child: Padding(
            padding: EdgeInsets.only(
                left: 15.w, right: 15.w, top: 10.h, bottom: 10.h),
            child: GetBuilder<PublicLogic>(
                builder: (logic) => Wrap(
                      spacing: 10.w,
                      runSpacing: 5.h,
                      children: logic.articleList
                          .map((element) => _buildItem(element))
                          .toList(),
                    ))));
  }

  Widget _buildItem(PublicBean element) {
    return GestureDetector(
      onTap: ()=>{},
      child:Container(
        padding: EdgeInsets.only(left: 8.w, top: 5.h, right: 8.w, bottom: 5.h),
        decoration: BoxDecoration(
            color: Color.fromARGB(random.nextInt(255), random.nextInt(255),
                random.nextInt(255), random.nextInt(255)),
            borderRadius: BorderRadius.circular(15.h)),
        child: Text(
          textAlign: TextAlign.center,
          element.name,
          style: TextStyle(color: ColorRes.white, fontSize: 14.sp),
        ),
      ),
    );
  }
}
