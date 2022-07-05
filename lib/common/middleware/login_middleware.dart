import 'package:flutter/material.dart';
import 'package:flutter_wan/common/service/service.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';

import '../route/app_routes.dart';

/// 配置用户属性页面
class LoginMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (!UserStore.instance.isLogin) {
      AppRoutes.toLogin();
    }
  }
}
