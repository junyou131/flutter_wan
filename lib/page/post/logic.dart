import 'package:flutter_wan/common/model/post_article_list_model.dart';
import 'package:flutter_wan/common/model/post_banner.dart';
import 'package:flutter_wan/common/provider/common_provider.dart';
import 'package:flutter_wan/common/service/z_service.dart';
import 'package:flutter_wan/common/utils/z_utils.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common/model/z_model.dart';
import '../../common/route/app_routes.dart';

class PostLogic extends GetxController {
  final idBanner = 'id_banner';
  final idPosts = 'id_posts';
  late RefreshController refreshController;
  var provider = Get.find<CommonProvider>();
  var bannerList = RxList<BannerModel>();
  var articleList = RxList<Article>();

  /// 要加 下拉刷新/上拉加载了
  var page = 0.obs;

  // toSearch() => AppRoutes.toLogin();
  toSearch() => AppRoutes.toPage(AppRoutes.postSearch);

  @override
  void onInit() {
    super.onInit();
    refreshController = RefreshController(initialRefresh: false);
  }

  @override
  void onReady() {
    // var data = WanRepository.instance.getHomeBanner();
    // print('首页数据：$data');
    getBanner();
    super.onReady();
  }

  @override
  void onClose() {
    refreshController.dispose();
  }

  onLoading() {
    page.value++;
    getPostList();
  }

  onRefresh() {
    page.value = 0;
    getPostList();
  }

  void getBanner() async {
    var response = await provider.getBanner();
    bannerList.value = PostBannerModel.fromJson(response.body).data;
    update([idBanner]);
    // printLog('返回banner列表：${response.body.toString()}');
    getPostList();
  }

  void getPostList() async {
    var response = await provider.getArticleList(page.value);
    if (page.value == 0) {
      articleList.clear();
    }
    articleList.addAll(PostArticleListModel.fromJson(response.body).data.datas);
    if (refreshController.isLoading) {
      refreshController.loadComplete();
    } else if (refreshController.isRefresh) {
      refreshController.refreshCompleted(resetFooterState: true);
    }
    update([idPosts]);
    // printLog('返回文章列表：${response.body.toString()}');
  }

  void collectPost(int index, int id) async {
    if (UserStore.instance.isLogin) {
      bool isCollect = articleList.value[index].collect;
      var response = !isCollect
          ? await provider.collectPost(id)
          : await provider.unCollectPost(id);
      NoDataModel model = NoDataModel.fromJson(response.body);
      if (model.errorCode == 0) {
        articleList.value[index].collect = !isCollect;
        GetSnackBar(
          message: !isCollect ? '收藏成功' : '取消收藏',
          duration: const Duration(seconds: 2),
        ).show();
        update([idPosts]);
      }
    } else {
      AppRoutes.toLogin();
    }
  }
}
