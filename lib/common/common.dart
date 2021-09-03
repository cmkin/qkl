import 'package:flutter/foundation.dart';

class Constant {
  static const String baseIp = '219.153.20.224';

  ///   测试环境
  //static String baseUrl = 'http://lhcq.tpddns.cn:23000/api';
  //static String baseUrl = 'https://219.153.20.224/prod-api';
  static String baseUrl =
      'https://www.fastmock.site/mock/bc3af1da916c49006fc9e1cd41510fb7/prod-api';

  ///  正式环境
  // static const String baseUrl = "http://47.111.94.90/safe";
  static const int successCode = 200;
  static const int reLoginCode = 400;

  ///长连接测试地址
//  static  const String WEB_SOCKET = "ws://192.168.3.99:13056/websocket/2";
  ///长连接正式地址
  static const String WEB_SOCKET = "ws://47.111.94.90:13056/websocket/2";

  ///RSA 公匙
  static const String WEB_SOCKET_KEY =
      "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCToVsd/baDpcyz+ztlOZz2uxibU40Un0jvDV1BMvctyXvSi9x0vX3/3ohoLzeAezCj4rOM0B5ALJZtxy818SvChbB4uK5MxrBT2plqcBTrJFyoKgNOP2iCEQCtsH9C8JCqPVNIMgHfiPMYyLr9g0AWXFlW7xdv7Xcue5RLsj3iawIDAQAB";

  /// debug开关，上线需要关闭
  /// App运行在Release环境时，inProduction为true；当App运行在Debug和Profile环境时，inProduction为false

  static const bool inProduction = kReleaseMode;

  static bool isDriverTest = false;
  static bool isUnitTest = false;

  static const String data = 'data';
  static const String message = 'message';
  static const String code = 'code';

  static const String keyGuide = 'keyGuide';
  static const String phone = 'phone';

  static const String theme = 'AppTheme';
  static const String themeColor = 'AppThemeColor';
  // 颜色样式
  static const String themeStyle = 'greenColorStyle';

  static const String userId = 'userId';
  static const String token = 'token';
  static const String realName = 'realName';
  static const String cardHistory = 'cardHistory';
  static const String ocrType = 'ocrType';
  static const String bindId = 'bindId';
  static const String bindName = 'bindName';
  static const String projectId = 'projectId';
  static const String projectName = 'projectName';
  static const String scanName = 'scanName';
  static const String scanUrl = 'scanUrl';
  static const String scanCompany = 'scanCompany';
  static const String scanPost = 'scanPost';
  static const String scanStaffId = 'scanStaffId';
  static const String locale = 'locale';
  static const String localeNumber = 'localeNumber';

  //当前是否展示的原生页面 key
  static const String isShowNative = 'isShowNative';
}
