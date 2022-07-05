import 'dart:ui';

import 'package:flutter_wan/common/constants.dart';
import 'package:flutter_wan/common/utils/utils.dart';
import 'package:get/get.dart';

import '../global/constants.dart';

class BaseConnect extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = Constants.BASE_URL;
    httpClient.addRequestModifier<void>((request) {
      // request.headers['authorization'] = '12345678';
      if (GlobalConstants.COOKIE.isNotEmpty) {
        request.headers[GlobalConstants.COOKIE_NAME] = GlobalConstants.COOKIE;
        // request.headers['cookie'] = GlobalConstants.COOKIE;
      }
      // request.headers.keys.forEach((element) {
      //   print('headers:$element _ ${request.headers[element]}');
      // });
      return request;
    });
    httpClient.addResponseModifier((request, response) {
      if (response.headers != null && response.headers!.isNotEmpty) {
        var cookie = response.headers!['set-cookie'];
        if (cookie != null && cookie.isNotEmpty) {
          GlobalConstants.COOKIE = cookie;
          printLog('返回的数据-cookie：${GlobalConstants.COOKIE}');
        }
      }
      // response.headers?.keys.forEach((element) {
      //   print('headers:$element _ ${response.headers?[element]}');
      // });
      return response;
    });
  }

  @override
  void onReady() {}
}
