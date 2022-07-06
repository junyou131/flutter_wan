import 'package:flutter/material.dart';
import 'package:flutter_wan/common/provider/common_provider.dart';
import 'package:get/get.dart';

import '../../../common/utils/z_utils.dart';

class RegisterLogic extends GetxController {
  var provider = Get.find<CommonProvider>();
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  late TextEditingController passwordAgainController;


  @override
  void onInit() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    passwordAgainController = TextEditingController();
    super.onInit();
  }
  register() async{
    var username = usernameController.text;
    var password = passwordController.text;
    var rePassword = passwordAgainController.text;
    var response = await provider.register(username, convertMd5(password), convertMd5(rePassword));
    Get.back();
    print('注册接口返回：${response.body}');
  }
}
