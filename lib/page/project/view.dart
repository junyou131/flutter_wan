import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wan/common/model/project_item_model.dart';
import 'package:flutter_wan/common/model/project_model.dart';
import 'package:flutter_wan/common/route/app_routes.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common/res/z_res.dart';
import '../../common/utils/utils.dart';
import '../../common/widget/widget.dart';
import 'logic.dart';

/// 项目列表
class ProjectPage extends GetView<ProjectLogic> {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(StringRes.tabProject.tr),
          centerTitle: true,
        ),
        body: Obx(
          () => Padding(
            padding:
                EdgeInsets.only(left: 5.w, right: 5.w, top: 10.w, bottom: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 80.w,
                  child: ListView.builder(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () => _changeProjectTag(index),
                            child: Container(
                              margin: EdgeInsets.only(top: 1.h, bottom: 1.h),
                              alignment: Alignment.center,
                              color: index == controller.chooseIndex.value
                                  ? Colors.purple
                                  : Colors.white,
                              height: 36.h,
                              child: Text(
                                  controller.projectList.value[index].name,
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: index != controller.chooseIndex.value
                                        ? Colors.black45
                                        : Colors.white,
                                  )),
                            ));
                      },
                      itemCount: controller.projectList.length),
                ),
                space(width: 5.w),
                Expanded(
                  child: SmartRefresher(
                    controller: controller.refreshController,
                    onRefresh: controller.onRefresh,
                    onLoading: controller.onLoading,
                    enablePullDown: true,
                    enablePullUp: true,
                    child: ListView.builder(
                      itemCount: controller.projects.length,
                      itemBuilder: (context, index) =>
                          _buildProject(controller.projects.value[index]),
                      cacheExtent: 80.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  _buildProject(Project project) {
    return GestureDetector(
      onTap: () => AppRoutes.toUrl(project.projectLink),
      child: Container(
        margin: EdgeInsets.only(left: 5.w, top: 5.w, right: 5.w),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        padding: EdgeInsets.all(5.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(project.title,
                        style:
                            TextStyle(fontSize: 12.sp, color: Colors.black87)),
                    space(height: 5.h),
                    Text('${project.niceDate} @${project.author}',
                        style: TextStyle(fontSize: 11.sp, color: Colors.blue)),
                    space(height: 5.h),
                    Text(project.desc,
                        maxLines: 3,
                        style:
                            TextStyle(fontSize: 10.sp, color: Colors.black45)),
                  ]),
            ),
            SizedBox(
              width: 60.w,
              child: CachedNetworkImage(imageUrl: project.envelopePic),
            )
          ],
        ),
      ),
    );
  }

  _changeProjectTag(int index) {
    printLog('打印日志：$index');
    controller.changeIndex(controller.projectList[index].id);
  }
}
