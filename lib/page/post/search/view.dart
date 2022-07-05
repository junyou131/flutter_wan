import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wan/common/model/hot_key_model.dart';
import 'package:flutter_wan/common/res/z_res.dart';
import 'package:flutter_wan/common/widget/base_scaffold.dart';
import 'package:flutter_wan/common/widget/common_widget.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../common/global/constants.dart';
import '../../../common/route/app_routes.dart';
import 'logic.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
  final _random = Random();
  final logic = Get.put(SearchLogic());

  @override
  Widget build(BuildContext context) {
    return commonScaffold(
      title: StringRes.search.tr,
      child: Padding(
        padding: EdgeInsets.only(left: 5.w, top: 5.w, right: 5.w, bottom: 5.w),
        child: SmartRefresher(
          controller: logic.refreshController,
          enablePullUp: true,
          enablePullDown: true,
          onLoading: logic.onLoading,
          onRefresh: logic.onRefresh,
          child: CustomScrollView(
            cacheExtent: 700,
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(StringRes.commonlyUsedSearch.tr,
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold)),
                    space(height: 10.h),
                    GetBuilder<SearchLogic>(
                      id: 'key',
                      builder: (logic) => Wrap(
                        runSpacing: 4.h,
                        spacing: 5.w,
                        children: logic.hotKeys
                            .map((e) => _buildHotSearchItem(e))
                            .toList(),
                      ),
                    ),
                    space(height: 10.h),
                  ],
                ),
              ),
              GetBuilder<SearchLogic>(
                  id: 'data',
                  builder: (logic) => SliverList(
                      delegate: SliverChildBuilderDelegate(
                          semanticIndexOffset: 10,
                          childCount: logic.articleList.length,
                          (context, index) => buildArticleItem(
                              logic.articleList[index],
                              () => logic.collectPost(),
                              (name) => {
                                    AppRoutes.toArticlesPage(
                                        name, GlobalConstants.AUTHOR, name),
                                  }))))
            ],
          ),
        ),
      ),
    );
  }

  // 生成 搜索热词模块
  Widget _buildHotSearchItem(HotKey e) => GestureDetector(
        onTap: () => logic.searchPost(e.name),
        child: Container(
          padding:
              EdgeInsets.only(left: 8.w, top: 5.h, right: 8.w, bottom: 5.h),
          decoration: BoxDecoration(
              color: Color.fromARGB(225, _random.nextInt(255),
                  _random.nextInt(255), _random.nextInt(255)),
              borderRadius: BorderRadius.circular(15.h)),
          child: Text(e.name,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12.sp, color: Colors.white)),
        ),
      );
}
