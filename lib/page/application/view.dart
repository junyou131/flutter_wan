
import 'package:flutter/material.dart';
import 'package:flutter_wan/common/service/z_service.dart';
import 'package:flutter_wan/page/post/logic.dart';
import 'package:flutter_wan/page/system/logic.dart';
import 'package:get/get.dart';

import '../../common/route/app_routes.dart';
import '../me/logic.dart';
import '../z_page.dart';
import '../project/logic.dart';
import 'logic.dart';

/// 首页
class ApplicationPage extends StatelessWidget {
  final logic = Get.put(ApplicationLogic());
  ApplicationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 默认显示中文简体
    Get.updateLocale(const Locale('zh', 'Hans'));
    Get.lazyPut(() => PostLogic());
    Get.lazyPut(() => SystemLogic());
    Get.lazyPut(() => ProjectLogic());
    Get.lazyPut(() => MeLogic());
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: logic.pageController,
        children: [
          PostPage(),
          ProjectPage(),
          PublicPage(),
          SystemPage(),
          MePage()
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => {Get.toNamed(AppRoutes.public)},
      //   child: const Icon(
      //     Icons.wechat,
      //     color: Colors.purple,
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  _buildBottomBar() {
    return Obx(() => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: logic.index.value,
            onTap: (index) => _changeItemIndex(index),
            items: [
              _buildBottomBarItem(0),
              _buildBottomBarItem(1),
              _buildBottomBarItem(2),
              _buildBottomBarItem(3),
              _buildBottomBarItem(4),
            ]));
  }

  _buildBottomBarItem(int index) {
    return BottomNavigationBarItem(
        icon: logic.icons[index], label: logic.titles[index].tr);
  }
  // 切换底部导航
  _changeItemIndex(int index) {
    var isNeedLogin = index == 4;
    if (isNeedLogin) {
      if (UserStore.instance.isLogin) {
        logic.changeIndex(index);
      }else{
        AppRoutes.toLogin();
      }
    } else {
      logic.changeIndex(index);
    }
  }
}
