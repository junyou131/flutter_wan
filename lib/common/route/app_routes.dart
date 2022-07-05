import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../global/constants.dart';

/// 路由
class AppRoutes {
  static const application = "/";
  static const user = "/user";
  static const login = "$user/login";
  static const register = "$user/register";

  static const post = "/post";

  static const postSearch = "$post/search";
  static const postDetails = "$post/details";

  static const project = "/project";
  static const public = "/public";

  /// 体系
  static const system = "/system";

  /// 体系文章列表
  static const systemArticles = "$system/articles";

  static const me = "/me";
  static const meSetting="$me/setting";

  static void toUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      launchUrlString(url);
    } else {
      const GetSnackBar(
        title: '链接跳转失败',
      ).show();
    }
  }

  static void toPage(String page) {
    Get.toNamed(page);
  }

  /// 登陆
  static void toLogin() {
    toPage(login);
  }

  /// 注册
  static void toRegister() {
    toPage(register);
  }

  /// 文章列表页
  static void toArticlesPage(String title, String type, String typeValue) {
    toPage(
        '$systemArticles?${GlobalConstants.TITLE}=$title&${GlobalConstants.TYPE}=$type&${GlobalConstants.TYPE_VALUE}=$typeValue');
  }
}
