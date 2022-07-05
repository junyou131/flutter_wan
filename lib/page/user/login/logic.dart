import 'package:flutter/material.dart';
import 'package:flutter_wan/common/model/login_model.dart';
import 'package:flutter_wan/common/provider/common_provider.dart';
import 'package:get/get.dart';
import '../../../common/service/service.dart';

import '../../../common/utils/utils.dart';

class LoginLogic extends GetxController {
  var provider = Get.find<CommonProvider>();
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  void onInit() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  login() async {
    var username = usernameController.value.text;
    var password = passwordController.value.text;
    if (username.isNotEmpty && password.isNotEmpty) {
      var response = await provider.login(username, convertMd5(password));
      UserInfoModel model = UserInfoModel.fromJson(response.body);
      UserInfo userInfo = model.data.info;
      if (model.errorCode == 0) {
        // 登陆成功 cookie已保存，继续保存用户信息
        UserStore.instance.saveLogin(true);
        UserStore.instance.setUsername(userInfo.username);
        Get.back();
      } else {
        GetSnackBar(
          message: model.errorMsg,
        ).show();
      }
    }
  }
}
