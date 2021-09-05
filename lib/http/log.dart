import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:zjsb_app/util/console.dart';

class Log extends Interceptor {
  bool deBug = true;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (this.deBug) {
      console.log('url请求------${options.path}----参数:${options.queryParameters}',
          lv: 10);
    }
    return super.onRequest(options, handler);
  }
}
