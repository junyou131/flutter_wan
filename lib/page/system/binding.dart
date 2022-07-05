import 'package:flutter_wan/page/system/logic.dart';
import 'package:get/get.dart';

class SystemBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SystemLogic());
  }

}