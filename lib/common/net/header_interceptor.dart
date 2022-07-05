
import 'package:dio/dio.dart';

import '../constants.dart';

class HeaderInterceptor extends Interceptor{

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll(
      {
        "boarding-pass": Constants.BOARDING_PASS,
        "auth-token": Constants.AUTH_TOKEN
      }
    );
  }
}