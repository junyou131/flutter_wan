import 'dart:async';

import 'package:flutter_wan/common/net/base_connect.dart';
import 'package:get/get.dart';

class CommonProvider extends BaseConnect {
  ///**************POST 首页****************
  /// 获取文章列表页面banner
  Future<Response> getBanner() => get('/banner/json');

  /// 获取文章列表
  Future<Response> getArticleList(int page) => get('/article/list/$page/json');

  /// 热词搜索
  Future<Response> getHotKeys() => get('/hotkey/json');
  /// 搜索文章
  Future<Response> getSearchPost(int page, String queryKey) =>
      post('/article/query/$page/json', {}, query: {'k': queryKey});

  /// 公众号
  Future<Response> getWechatArticles()=>get('/wxarticle/chapters/json');

  ///**************System 体系****************
  /// 获取体系列表
  Future<Response> getSystemInfo() => get('/tree/json');

  // 获取体系文章列表
  Future<Response> getSystemArticles(int page, String type, String typeValue) =>
      get('/article/list/$page/json?$type=$typeValue');

  ///**************Project 项目****************
  /// 获取项目分类列表
  Future<Response> getProjects() => get('/project/tree/json');

  /// 获取项目分类项目列表
  Future<Response> getProjectList(int page, String cid) =>
      get('/project/list/$page/json?cid=$cid');

  ///**************User 用户****************
  /// 登陆
  Future<Response> login(String username, String password) =>
      post('/user/login', {},
          query: {'username': username, 'password': password});

  /// 注册
  Future<Response> register(
          String username, String password, String repassword) =>
      post('/user/register', {}, query: {
        'username': username,
        'password': password,
        'repassword': repassword,
      });

  /// 用户信息
  Future<Response> getUserinfo() => get('/user/lg/userinfo/json');
  /// 收藏文章
  Future<Response> collectPost(int id)=>post('/lg/collect/$id/json',{});
  /// 取消收藏文章
  Future<Response> unCollectPost(int id)=>post('/lg/uncollect_originId/$id/json',{});
}
