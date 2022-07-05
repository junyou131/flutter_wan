import 'package:flutter_wan/page/user/register/logic.dart';
import 'package:get/get.dart';

class RegisterBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterLogic());
  }
}