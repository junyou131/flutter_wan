import 'package:flutter_wan/common/route/app_routes.dart';
import 'package:flutter_wan/page/post/binding.dart';
import 'package:flutter_wan/page/user/login/binding.dart';
import 'package:flutter_wan/page/user/register/binding.dart';

import 'package:get/get.dart';

import '../../page/me/setting/setting_binding.dart';
import '../../page/z_page.dart';
import '../../page/post/search/binding.dart';
import '../../page/system/system_articles/system_articles_binding.dart';
// pages
class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.application, page: () => ApplicationPage()),
    GetPage(name: AppRoutes.login, page: () => LoginPage(),binding: LoginBinding()),
    GetPage(name: AppRoutes.register, page: () => RegisterPage(),binding: RegisterBinding()),
    GetPage(name: AppRoutes.post, page: ()=>PostPage(),binding: PostBinding()),
    GetPage(name: AppRoutes.postSearch, page: ()=>SearchPage(),binding: SearchBinding()),
    GetPage(name: AppRoutes.postDetails, page: ()=>DetailsPage()),
    GetPage(name: AppRoutes.project, page: ()=>ProjectPage()),
    GetPage(name: AppRoutes.system, page: ()=>SystemPage()),
    GetPage(name: AppRoutes.systemArticles,page: ()=>SystemArticlesPage(),binding:SystemArticlesBinding()),
    GetPage(name: AppRoutes.me, page: ()=>MePage()),
    GetPage(name: AppRoutes.meSetting,page: ()=>SettingPage(),binding:SettingBinding()),
  ];
}
