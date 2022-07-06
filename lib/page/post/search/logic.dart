import 'package:flutter_wan/common/model/hot_key_model.dart';
import 'package:flutter_wan/common/utils/z_utils.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../common/model/z_model.dart';
import '../../../common/provider/common_provider.dart';
import '../../../common/route/app_routes.dart';
import '../../../common/service/z_service.dart';

class SearchLogic extends GetxController {
  var provider = Get.find<CommonProvider>();
  var hotKeys = RxList<HotKey>();
  var articleList = RxList<Article>();
  late RefreshController refreshController;
  var page = 0;
  String mKey = '';

  @override
  void onInit() {
    refreshController = RefreshController();
    super.onInit();
  }

  @override
  void onReady() {
    getHotKeys();
    super.onReady();
  }

  getHotKeys() async {
    var response = await provider.getHotKeys();
    hotKeys.addAll(HotKeyModel.fromJson(response.body).data);
    mKey = hotKeys[0].name;
    printLog('hotKeys:${hotKeys.length}');
    update(['key']);
    searchPost(mKey);
  }

  void searchPost(String searchKey) async {
    mKey = searchKey;
    var response = await provider.getSearchPost(page, mKey);
    if (page == 0) {
      articleList.clear();
    }
    articleList.addAll(PostArticleListModel.fromJson(response.body).data.datas);
    if (refreshController.isLoading) {
      refreshController.loadComplete();
    } else if (refreshController.isRefresh) {
      refreshController.refreshCompleted(
        resetFooterState: true,
      );
    }
    if (articleList.length % 10 != 0) {
      refreshController.loadNoData();
    }
    update(['data']);
  }

  onRefresh() {
    page = 0;
    searchPost(mKey);
  }

  onLoading() {
    page++;
    searchPost(mKey);
  }

  void collectPost() async {
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
