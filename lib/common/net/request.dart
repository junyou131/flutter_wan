import 'package:flutter_wan/common/model/base_response.dart';

import 'http_request.dart';

class Request {
  static void get<T>(String url, params,
      {bool isJson = false,
      bool dialog = true,
      Success<T>? success,
      Failed? failed}) {
    _request(Method.GET, url, params,
        isJson: isJson, dialog: dialog, success: success, failed: failed);
  }

  static void post<T>(String url, params,
      {bool isJson = false,
      bool dialog = true,
      Success<T>? success,
      Failed? failed}) {
    _request(Method.POST, url, params,
        isJson: isJson, dialog: dialog, success: success, failed: failed);
  }

  static void _request<T>(Method method, String url, params,
      {required bool isJson,
      required bool dialog,
      Success<T>? success,
      Failed? failed}) {
    if (dialog) {}
    params.forEach((key, value) {
      if (url.contains(key)) {
        url = url.replaceAll(':$key', value.toString());
      }
    });
    HttpRequest.request(method, url, params, isJson: isJson, success: (result) {
      if (success != null) {
        var resultModel = BaseResponse.fromJson(result);
        if (resultModel.errorCode == 0) {
          success(resultModel.data);
        } else {
        }
      }
    }, failed: (code, msg) {
      if (dialog) {}
      if (failed != null) {
        failed(code, msg);
      }
    });
  }
}
