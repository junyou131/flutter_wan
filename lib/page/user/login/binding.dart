import 'package:flutter_wan/page/user/login/logic.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LoginLogic());
  }
}