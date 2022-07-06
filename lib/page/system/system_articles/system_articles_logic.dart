import 'package:flutter_wan/common/provider/common_provider.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../common/global/constants.dart';
import '../../../common/model/z_model.dart';
import '../../../common/route/app_routes.dart';
import '../../../common/service/z_service.dart';
import '../../../common/utils/z_utils.dart';

class SystemArticlesLogic extends GetxController {
  var provider = Get.find<CommonProvider>();
  late RefreshController refreshController;
  var articleList = RxList<Article>();
  late String type;
  late String typeValue;

  /// 要加 下拉刷新/上拉加载了
  var page = 0.obs;

  @override
  void onInit() {
    refreshController = RefreshController();
    var params = Get.parameters;
    if (params != null) {
      type = params[GlobalConstants.TYPE]!;
      typeValue = params[GlobalConstants.TYPE_VALUE]!;
    }
    super.onInit();
  }

  @override
  void onReady() {
    getArticles();
    super.onReady();
  }

  void getArticles() async {
    var response =
        await provider.getSystemArticles(page.value, type, typeValue);
    if (page.value == 0) {
      articleList.clear();
    }
    articleList.addAll(PostArticleListModel.fromJson(response.body).data.datas);
    if (refreshController.isLoading) {
      refreshController.loadComplete();
    } else if (refreshController.isRefresh) {
      refreshController.refreshCompleted(resetFooterState: true);
    }
  }

  onLoading() {
    page.value++;
    getArticles();
  }

  onRefresh() {
    page.value = 0;
    getArticles();
  }

  void collectPost() {
    if (UserStore.instance.isLogin) {
      const GetSnackBar(
        message: '点赞支持ð',
        duration: Duration(seconds: 2),
      ).show();
    } else {
      AppRoutes.toLogin();
    }
  }
}
