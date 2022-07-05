import 'package:flutter/material.dart';
import 'package:flutter_wan/common/global/constants.dart';
import 'package:flutter_wan/common/route/app_routes.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../common/utils/utils.dart';
import '../../../common/widget/common_widget.dart';
import 'system_articles_logic.dart';

class SystemArticlesPage extends GetView<SystemArticlesLogic> {
  var logic =Get.find<SystemArticlesLogic>();
  @override
  Widget build(BuildContext context) {
    var params = Get.parameters;
    printLog('page:${params.toString()}');
    var title = 'title';
    if (params != null) {
      title = params[GlobalConstants.TITLE].toString();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Obx(
        () => Padding(
            padding:
                const EdgeInsets.only(left: 5, right: 10, top: 5, bottom: 10),
            child: SmartRefresher(
              controller: controller.refreshController,
              enablePullDown: true,
              enablePullUp: true,
              onLoading: controller.onLoading,
              onRefresh: controller.onRefresh,
              child: ListView.builder(
                itemCount: controller.articleList.length,
                itemBuilder: (context, index) => buildArticleItem(
                  controller.articleList[index],
                  () => controller.collectPost(),
                  (name) => {
                    AppRoutes.toArticlesPage(name, GlobalConstants.AUTHOR, name)
                  },
                ),
              ),
            )),
      ),
    );
  }
}
