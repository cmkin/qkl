import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:zjsb_app/page/login/page/login_page.dart';
import 'package:zjsb_app/page/login/page/password_page.dart';
import 'package:zjsb_app/page/routers/i_router.dart';

class LoginRouter implements IRouterProvider {
  static String loginPage = '/login';
  static String passwordPage = '/password';

  @override
  void initRouter(FluroRouter router) {
    router.define(loginPage,
        handler: Handler(
            handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
                LoginPage()));
    router.define(passwordPage,
        handler: Handler(
            handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
                PassWordPage()));
  }
}
