import 'package:flutter_wan/page/post/logic.dart';
import 'package:get/get.dart';

class PostBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PostLogic());
  }
}