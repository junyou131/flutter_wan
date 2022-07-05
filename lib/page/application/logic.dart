import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/res/z_res.dart';

class ApplicationLogic extends GetxController {
  var index = 0.obs;
  var pageController = PageController();
  final titles = [
    StringRes.tabPost,
    StringRes.tabProject,
    StringRes.tabThePublic,
    StringRes.tabSystem,
    StringRes.tabMine
  ];
  final icons = [
    const Icon(Icons.local_post_office_sharp),
    const Icon(Icons.production_quantity_limits),
    const Icon(Icons.wechat),
    const Icon(Icons.account_tree),
    const Icon(Icons.person)
  ];

  changeIndex(index) {
    this.index.value = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }
}
