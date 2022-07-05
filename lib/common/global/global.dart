import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:flutter_wan/common/provider/common_provider.dart';
import 'package:flutter_wan/common/service/storage_service.dart';
import 'package:flutter_wan/common/service/user_store.dart';
import 'package:get/get.dart';

class Global {
  static Future<void> init() async {
    //强制竖屏
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    /// 异步初始化数据持久化
    await Get.putAsync(() => StorageService().getInstance());
    /// 加载provider
    Get.lazyPut(() => CommonProvider());

    /// 懒加载用户信息
    Get.lazyPut(() => UserStore());
    // //创建缓存目录
    // String? cachePath;
    // if (!GetPlatform.isWeb) {
    //   // 当前文件路径不支持web端
    //   var cache = await getTemporaryDirectory();
    //   cachePath = cache.path;
    // }
    // //网络组件初始化
    // HttpConfig config = HttpConfig(
    //     showLog:false,
    //     baseUrl: Constants.BASE_URL,
    //     headers: {"course-flag": Constants.COURSE_FLAG},
    //     cachePath: cachePath);
    // HttpClient client = HttpClient(config);
    // Get.lazyPut(() => WanRepository(client));
  }
}
