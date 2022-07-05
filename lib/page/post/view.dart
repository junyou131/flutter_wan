import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wan/common/global/constants.dart';
import 'package:flutter_wan/common/model/post_banner.dart';
import 'package:flutter_wan/common/res/z_res.dart';
import 'package:flutter_wan/common/widget/common_widget.dart';
import 'package:flutter_wan/common/widget/post_banner.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common/route/app_routes.dart';
import 'logic.dart';

/// 博文
class PostPage extends GetView<PostLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringRes.tabPost.tr),
        actions: [
          IconButton(
              onPressed: () => _actionSearch(), icon: const Icon(Icons.search))
        ],
      ),
      body: Obx(() => Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: SmartRefresher(
              controller: controller.refreshController,
              enablePullUp: true,
              enablePullDown: true,
              onLoading: controller.onLoading,
              onRefresh: controller.onRefresh,
              child: CustomScrollView(
                cacheExtent: 700,
                slivers: [
                  SliverToBoxAdapter(
                    child: _buildBanner(controller.bannerList),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return buildArticleItem(
                          controller.articleList[index],
                          () => controller.collectPost(),
                          (name) => {
                                AppRoutes.toArticlesPage(
                                    name, GlobalConstants.AUTHOR, name),
                              });
                    },
                        childCount: controller.articleList.length,
                        semanticIndexOffset: 10),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  _actionSearch() {
    controller.toSearch();
  }

  _buildBanner(RxList<BannerModel> list) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: PostBanner(
        bannerList: list.value,
        bannerHeight: 177.h,
      ),
    );
  }
}
