import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:zjsb_app/page/home/page/home_page.dart';
import 'package:zjsb_app/page/routers/i_router.dart';

class HomeRouter implements IRouterProvider {
  static String homePage = '/home';

  @override
  void initRouter(FluroRouter router) {
    router.define(homePage,
        handler: Handler(
            handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
                Home()));
  }
}
