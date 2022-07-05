import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

typedef OnFailed = Function(dynamic error, int? code, String? msg);
typedef OnSuccess = Function(dynamic data);
/// 网络请求委托
extension ControllerExt on GetxController {
  Future<void> asyncRequest(Future<Response> Function() request,
      {required OnSuccess? onSuccess, OnFailed?onFailed}) async {
    try{
      Response response = await request();
      var code = response.body["errorCode"];
      var msg = response.body["errorMsg"];
      var data = response.body["data"];
      if(code == 0){
        onSuccess?.call(data);
      }else{
        onFailed?.call(data,code,msg);
      }
    } on Exception catch(error){
      handleError(error);
    }
  }
  /// 统一异常处理
  void handleError(Exception error, {OnFailed? onFailure}) {
    int? code = -1;
    String? msg = "未知异常";
    dynamic errorData;
    if (error is dio.DioError) {
      // dio 异常
      switch (error.type) {
        case dio.DioErrorType.connectTimeout:
          msg = "连接超时,请稍后再试";
          break;
        case dio.DioErrorType.receiveTimeout:
          msg = "响应超时,请稍后再试";
          break;
        case dio.DioErrorType.sendTimeout:
          msg = "请求超时,请稍后再试";
          break;
        case dio.DioErrorType.cancel:
          msg = "请求取消";
          break;
        case dio.DioErrorType.response:
        //状态码异常
          code = error.response?.statusCode;
          errorData = error.response?.data;
          if (code != null) {
            handleStatusCode(code);
          }
          break;
        case dio.DioErrorType.other:
          if (error.error is SocketException) {
            msg = "当前无网络，请检查你的网络设置";
          }
          break;
      }
    } else {
      //其他异常，例如json解析异常等
      msg = "请求报错 ${error.toString()}";
      errorData = error;
    }
    //显示全局错误
    // Loading.dismiss();
    // Loading.showError(msg);
    onFailure?.call(errorData, code, msg);
  }

  /// 统一状态码处理
  void handleStatusCode(int code) {}
}
