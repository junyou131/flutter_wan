import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wan/common/model/z_model.dart';
import 'package:flutter_wan/common/widget/base_scaffold.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common/res/z_res.dart';
import 'logic.dart';

class SystemPage extends GetView<SystemLogic> {
  @override
  Widget build(BuildContext context) {
    return commonScaffold(
        title: StringRes.tabSystem.tr,
        child: Obx(() => Padding(
              padding: EdgeInsets.all(5.w),
              child: SmartRefresher(
                enablePullUp: false,
                enablePullDown: true,
                onRefresh: controller.onRefresh,
                controller: controller.refreshController,
                child: ListView.custom(
                  childrenDelegate: SliverChildBuilderDelegate(
                      (context, index) =>
                          _buildItem(controller.systemList[index]),
                      childCount: controller.systemList.length,
                      semanticIndexOffset: 10),
                  // (context, index) => _buildItem(controller.list[index])),
                ),
              ),
            )));
  }

  _buildItem(SystemInfo item) {
    return GestureDetector(
      onTap: () => {},
      child: Container(
        padding: EdgeInsets.all(5.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(3.r)),
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3.r)],
        ),
        margin: EdgeInsets.only(left: 5.w, right: 5.w, top: 10.h, bottom: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.name,
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold),
            ),
            space(height: 5.h),
            Wrap(
              spacing: 2,
              runSpacing: 5,
              children: item.children
                  .map((e) => TextButton(
                      onPressed: () => {
                            controller.toArticles(e.name, e.id.toString()),
                          },
                      child: Text(
                        e.name,
                        style: TextStyle(
                            color: Colors.blueAccent, fontSize: 12.sp),
                      )))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
