import 'package:flutter/material.dart';
import 'package:flutter_wan/common/res/language/chinese.dart';
import 'package:flutter_wan/common/res/language/english.dart';
import 'package:get/get.dart';

import 'hong_kong.dart';

class TranslationService extends Translations{
  static Locale? get locale =>Get.deviceLocale;
  static const fallbackLocale = Locale('zh','Hans');
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US':en_US,
    'zh_Hans':zh_Hans,
    'zh_HK':zh_HK,
  };
}