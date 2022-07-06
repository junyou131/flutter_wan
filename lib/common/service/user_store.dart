import 'package:flutter_wan/common/global/constants.dart';
import 'package:flutter_wan/common/service/storage_service.dart';
import 'package:flutter_wan/common/utils/z_utils.dart';
import 'package:get/get.dart';

class UserStore extends GetxController {
  static UserStore get instance => Get.find();
  final RxString _username = ''.obs;
  final _isLogin = false.obs;

  bool get isLogin => _isLogin.value;

  String get username => _username.value;

  void setUsername(String username) {
    _username.value = username;
  }

  @override
  void onInit() {
    super.onInit();
    _isLogin.value = StorageService.instance.getBool(GlobalConstants.IS_LOGIN);
    if (_isLogin.value) {
      GlobalConstants.COOKIE =
          StorageService.instance.getString(GlobalConstants.COOKIE_NAME);
      printLog('用户已登陆 cookie:${GlobalConstants.COOKIE}');
      _username.value =
          StorageService.instance.getString(GlobalConstants.USERNAME);
    }
  }

  Future<void> saveLogin(bool isLogin) async {
    _isLogin.value = isLogin;
    StorageService.instance.setBool(GlobalConstants.IS_LOGIN, isLogin);
    if (isLogin) {
      StorageService.instance
          .setString(GlobalConstants.COOKIE_NAME, GlobalConstants.COOKIE);
      printLog('登陆成功，保存用户信息');
    } else {
      StorageService.instance.remove(GlobalConstants.COOKIE_NAME);
      GlobalConstants.COOKIE = '';
      printLog('用户推出，清空信息');
    }
  }
}
