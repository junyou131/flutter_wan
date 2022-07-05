import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/res/z_res.dart';
import 'logic.dart';

class PublicPage extends StatelessWidget {
  final logic = Get.put(PublicLogic());

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(StringRes.tabThePublic.tr),);
  }
}
