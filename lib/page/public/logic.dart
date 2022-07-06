import 'package:flutter_wan/common/model/public_model.dart';
import 'package:flutter_wan/common/utils/z_utils.dart';
import 'package:get/get.dart';

import '../../common/provider/common_provider.dart';

class PublicLogic extends GetxController {
  var provider = Get.find<CommonProvider>();
  var articleList = RxList<PublicBean>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    getWechatArticles();
    super.onReady();
  }

  void getWechatArticles() async {
    var response = await provider.getWechatArticles();
    // printLog('公众号数据返回：${response.body}');

    articleList.addAll(PublicModel.fromJson(response.body).data);
    update();
  }
}
