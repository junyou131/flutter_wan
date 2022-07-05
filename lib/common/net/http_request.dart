import 'dart:convert';
// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_wan/common/constants.dart';
import '../net/http_exception.dart';

/// 链接超时时间
const int _connectTimeout = 10000;

/// 接收超时时间
const int _receiveTimeout = 10000;

/// 发送超时时间
const int _sendTimeout = 10000;

typedef Success<T> = Function(T data);
typedef Failed = Function(int code, String msg);

class HttpRequest {
  static const String _token = '';
  static Dio? _dio;

  static Dio instance([bool isJson = false]) {
    if (_dio == null) {
      var options = BaseOptions(
          contentType: isJson
              ? Headers.jsonContentType
              : Headers.formUrlEncodedContentType,
          validateStatus: (status) => true,
          baseUrl: Constants.BASE_URL,
          sendTimeout: _sendTimeout,
          connectTimeout: _connectTimeout,
          receiveTimeout: _receiveTimeout);
      _dio = Dio(options);
    }
    _dio?.options.contentType =
        isJson ? Headers.jsonContentType : Headers.formUrlEncodedContentType;
    return _dio!;
  }

  static Future request<T>(Method method, String path, dynamic params,
      {bool isJson = false, Success? success, required Failed? failed}) async {
    // var connectivityResult = await (Connectivity().checkConnectivity());
    try {
    //   if (connectivityResult == ConnectivityResult.none) {
    //     /// 网络异常，请检查您的网络
    //     return;
    //   }
      Dio _dio = instance(isJson);
      Response response = await _dio.request(path,
          data: params,
          options:
              Options(method: _methodValues[method], headers: _headerToken()));
      if (success != null) {
        success(response.data);
      }
    } on DioError catch (e) {
      final NetError netError = HttpException.handleException(e);
      _onError(netError.code, netError.msg, (code, msg) => failed);
      debugPrint(netError.msg);
    }
  }
}

Map<String, dynamic>? _headerToken() {
  Map<String, dynamic> httpHeaders = {
    'Cookie': 'loginUserName=username;loginUserPassword=password',
  };
  return null;
}

void _onError(int code, String msg, Failed? failed) {
  if (code == 0) {
    code = HttpException.unknownError;
    msg = '未知异常';
  }
  if (failed != null) {
    failed(code, msg);
  }
}

Map<String, dynamic> parseData(String data) {
  return json.decode(data) as Map<String, dynamic>;
}

enum Method { POST, GET, DELETE, PUT, PATCH, HEAD }

const _methodValues = {
  Method.GET: 'get',
  Method.POST: 'post',
  Method.HEAD: 'head',
  Method.DELETE: 'delete',
  Method.PATCH: 'patch',
  Method.PUT: 'put',
};
