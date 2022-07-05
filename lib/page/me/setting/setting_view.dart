import 'package:flutter/material.dart';
import 'package:flutter_wan/common/widget/base_scaffold.dart';
import 'package:get/get.dart';

import 'setting_logic.dart';

class SettingPage extends StatelessWidget {
  final logic = Get.find<SettingLogic>();

  SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return commonScaffold(title: 'setting', child: Column());
  }
}
