import 'package:flutter_wan/common/model/post_article_list_model.dart';
import 'package:flutter_wan/common/model/post_banner.dart';
import 'package:flutter_wan/common/provider/common_provider.dart';
import 'package:flutter_wan/common/service/service.dart';
import 'package:flutter_wan/common/utils/utils.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common/route/app_routes.dart';

class PostLogic extends GetxController {
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

    printLog('返回banner列表：${response.body.toString()}');

    ///
    getPostList();
  }

  void getPostList() async {
    var response = await provider.getArticleList(page.value);
    if(page.value == 0){
      articleList.clear();
    }
    articleList.addAll(PostArticleListModel.fromJson(response.body).data.datas);
    if(refreshController.isLoading){
      refreshController.loadComplete();
    }else if(refreshController.isRefresh){
      refreshController.refreshCompleted(resetFooterState: true);
    }
    printLog('返回文章列表：${response.body.toString()}');
  }
  void collectPost() async{
    if(UserStore.instance.isLogin) {
      GetSnackBar(message: '点赞支持ð',duration: Duration(seconds: 2),).show();
    }else{
      AppRoutes.toLogin();
    }
  }
}
