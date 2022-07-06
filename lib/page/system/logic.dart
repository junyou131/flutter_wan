import 'package:flutter_wan/common/global/constants.dart';
import 'package:flutter_wan/common/model/z_model.dart';
import 'package:flutter_wan/common/provider/common_provider.dart';
import 'package:flutter_wan/common/utils/z_utils.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common/route/app_routes.dart';

class SystemLogic extends GetxController {
  late RefreshController refreshController;
  CommonProvider provider = Get.find();
  var systemList = RxList<SystemInfo>();

  onRefresh() {
    getSystemInfo();
  }

  @override
  void onInit() {
    refreshController = RefreshController();
    super.onInit();
  }

  @override
  void onReady() {
    getSystemInfo();
    super.onReady();
  }

  void getSystemInfo() async {
    var response = await provider.getSystemInfo();
    systemList.value = SystemModel.fromJson(response.body).data;
    printLog('体系数据返回：${systemList.toString()}');
    if (refreshController.isRefresh) {
      refreshController.refreshCompleted(resetFooterState: false);
    }
  }

  toArticles(String title, String cid) {
    AppRoutes.toArticlesPage(title, GlobalConstants.CID, cid);
  }
}
