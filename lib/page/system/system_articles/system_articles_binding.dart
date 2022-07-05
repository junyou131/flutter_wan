import 'package:get/get.dart';

import 'system_articles_logic.dart';

class SystemArticlesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SystemArticlesLogic());
  }
}
