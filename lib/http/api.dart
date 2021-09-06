import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:zjsb_app/common/common.dart';
import 'package:zjsb_app/http/api_response.dart';
import 'package:zjsb_app/http/http_utils.dart';
import 'package:zjsb_app/util/toast.dart';
import 'package:zjsb_app/common/common.dart';
import 'package:sp_util/sp_util.dart';

//数据类
import 'package:zjsb_app/http/models/home_list.dart';
import 'package:zjsb_app/http/models/login.dart';
import 'package:zjsb_app/http/models/user_info.dart';

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
    try {
      final response = await HttpUtils.post(url,
          data: {username: username, password: password});
      var res = Login.fromJson(response);
      //请求成功
      if (res.code == Constant.successCode) {
        //200
        return res.token;
      } else {
        //其他错误提示
        _onError(res.code);
        return false;
      }
    } on DioError catch (e) {
      return e.error;
    }
  }

  //通过userid(token)查询用户
  static Future userInfo(String token) async {
    final String url = '/user/user/findById?token=$token';
    try {
      final response = await HttpUtils.get(url);
      var res = UserInfo.fromJson(response);
      //请求成功
      if (res.code == Constant.successCode) {
        //200
        return res.data;
      } else {
        //其他错误提示
        _onError(res.code);
        return false;
      }
    } on DioError catch (e) {
      return e.error;
    }
  }
}

////////////////////////首页接口////////////

class homePage {
  //设备列表

  static getDeviceList(int groupId) async {
    final langId = await _langId.getId();
    final String url = "/product/list?groupId=$groupId&langId=$langId";

    try {
      final response = await HttpUtils.get(url);
      var res = homeList.fromJson(response);
      //请求成功
      if (res.code == Constant.successCode) {
        //200
        return res.data;
      } else {
        //其他错误提示
        _onError(res.code);
        return [];
      }
    } on DioError catch (e) {
      return e.error;
    }
  }
}
