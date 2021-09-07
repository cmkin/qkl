import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:zjsb_app/util/console.dart';

class Log extends Interceptor {
  bool deBug = true;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (this.deBug) {
      console.log(
          'url请求------${options.path}----参数:${options.queryParameters} ---请求头:${options.headers}',
          lv: 10);
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    if (this.deBug) {
      console.log('${response.requestOptions.path}请求结果------${response.data}',
          lv: 5);
    }

    return super.onResponse(response, handler);
  }
}
