import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_wan/common/net/header_interceptor.dart';

import 'http_config.dart';

enum RequestMethod { GET, POST, DELETE, PUT }

class HttpClient {
  late HttpConfig config;
  late Dio _dio;

  HttpClient(this.config) {
    initDio();
  }

  //用于取消请求
  CancelToken cancelToken = CancelToken();

  void initDio() {
    var options = BaseOptions();
    options.baseUrl = config.baseUrl;
    options.headers = config.headers;
    options.connectTimeout = config.connectTimeout;
    options.receiveTimeout = config.receiveTimeout;
    options.sendTimeout = config.sendTimeout;
    //cookie 配置
    if (config.cookiesPath?.isNotEmpty ?? false) {
      _dio.interceptors.add(CookieManager(
          PersistCookieJar(storage: FileStorage(config.cookiesPath))));
    }
    //缓存配置 缓存Interception
    if (config.cachePath?.isNotEmpty ?? false) {
      var cacheStore = HiveCacheStore(config.cachePath);
      //forceCache 可以忽略服务器的缓存配置
      //maxStale 缓存失效时间
      final cacheOptions = CacheOptions(
          store: cacheStore,
          policy: CachePolicy.forceCache,
          maxStale: const Duration(seconds: 5 * 60));
      _dio.interceptors.add(DioCacheInterceptor(options: cacheOptions));
    }
    _dio.interceptors.add(HeaderInterceptor());

    // 日志拦截  打印请求体，不打印返回头
    if (config.showLog) {
      _dio.interceptors
          .add(LogInterceptor(requestBody: true, responseHeader: false));
    }
  }
  /// 封装网络请求
  Future<Response> fire(RequestMethod method, String url,
      {Map<String, dynamic>? params,
      Options? options,
      CancelToken? cancelToken}) async {
    late Response response;
    if (method == RequestMethod.GET) {
      response = await _dio.get(url,
          queryParameters: params,
          options: options,
          cancelToken: cancelToken ?? cancelToken);
    } else if (method == RequestMethod.POST) {
      response = await _dio.post(url,
          queryParameters: params,
          options: options,
          cancelToken: cancelToken ?? cancelToken);
    } else if (method == RequestMethod.DELETE) {
      response = await _dio.delete(url,
          queryParameters: params,
          options: options,
          cancelToken: cancelToken ?? cancelToken);
    } else if (method == RequestMethod.PUT) {
      response = await _dio.put(url,
          queryParameters: params,
          options: options,
          cancelToken: cancelToken ?? cancelToken);
    }
    return response;
  }
}
