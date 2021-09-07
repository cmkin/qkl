import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:zjsb_app/common/common.dart';
import 'package:zjsb_app/http/api_response.dart';
import 'package:zjsb_app/http/http_utils.dart';
import 'package:zjsb_app/http/models/device_list.dart';
import 'package:zjsb_app/http/models/shop_detail.dart';
import 'package:zjsb_app/util/toast.dart';
import 'package:zjsb_app/common/common.dart';
import 'package:sp_util/sp_util.dart';

//数据类
import 'package:zjsb_app/http/models/home_list.dart';
import 'package:zjsb_app/http/models/login.dart';
import 'package:zjsb_app/http/models/user_info.dart';
import 'package:zjsb_app/http/models/home_new.dart';
import 'package:zjsb_app/http/models/all_newest.dart';

//请求成功---自定义错误提示处理
class _onError {
  int code;

  _onError(int code) {
    Toast.show('错误码:$code');
  }
}

//获取语言id

class _langId {
  static getId() async {
    switch (SpUtil.getString(Constant.localeNumber)) {
      case 'zh':
        return 1;
      case 'en':
        return 2;
      default:
        return 1;
    }
  }
}

///////////////登录注册接口///////////

class loginRec {
  //登录接口
  static login(String username, String password) async {
    final String url = '/user/login/login';
    final response = await HttpUtils.post(url,
        data: {username: username, password: password});
    var res = Login.fromJson(response);
    return res.token;
  }

  //通过userid(token)查询用户
  static Future userInfo(String token) async {
    final String url = '/user/user/findById?token=$token';
    final response = await HttpUtils.get(url);
    UserInfo res = UserInfo.fromJson(response);
    return res.data;
  }
}

////////////////////////首页接口////////////

class homePage {
  //设备列表
  static getDeviceList(int groupId) async {
    final String url = "/product/list?groupId=$groupId";
    final response = await HttpUtils.get(url);
    var res = homeList.fromJson(response);
    return res.data;
  }

  //首页-最新消息
  static getHomeNewest() async {
    final String url = "/notice/newest";
    final response = await HttpUtils.get(url);
    var res = HomeNew.fromJson(response);
    return res.data;
  }

  //商品详情
  static getShopDetail(int prodId) async {
    final String url = "/product/info?prodId=$prodId";
    final response = await HttpUtils.get(url);
    var res = ShopDetail.fromJson(response);
    return res.data;
  }
}

//////////////消息列表///////////////

class MessagePage {
  //平台公告
  static getAllNewest() async {
    final String url = "/notice/list";
    final response = await HttpUtils.get(url);
    var res = AllNewest.fromJson(response);
    return res.data;
  }
}

//////设备////////////

class Device {
  //设备列表
  static getDeviceList() async {
    String token = SpUtil.getString(Constant.token);
    if (token == null) {
      return false;
    }
    final String url = "/user/device/devByUserId?token=$token";
    final response = await HttpUtils.get(url);
    var res = DeviceList.fromJson(response);
    return res.data;
  }
}
