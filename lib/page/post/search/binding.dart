import 'package:flutter_wan/page/post/search/logic.dart';
import 'package:get/get.dart';

class SearchBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SearchLogic());
  }
}