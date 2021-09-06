import 'dart:io';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_picker/PickerLocalizationsDelegate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';
import 'package:zjsb_app/common/provider/theme_provider.dart';
import 'package:zjsb_app/generated/l10n.dart';
import 'package:zjsb_app/mvp/net/intercept.dart';
import 'package:zjsb_app/page/home/page/home_page.dart';
import 'package:zjsb_app/page/home/page/tab_page.dart';
import 'package:zjsb_app/page/home/page/test/test_page.dart';
import 'package:zjsb_app/page/home/page/test/test_page3.dart';
import 'package:zjsb_app/page/login/page/login_page.dart';
import 'package:zjsb_app/page/mine/presenter/locale_provider.dart';
import 'widgets/webview/web_page.dart';
import 'package:zjsb_app/page/routers/not_found_page.dart';
import 'package:zjsb_app/page/routers/routers.dart';
import 'package:zjsb_app/util/device_utils.dart';
import 'package:zjsb_app/util/log_utils.dart';

import 'common/common.dart';
import 'mvp/net/dio_utils.dart';
import 'package:fluwx_no_pay/fluwx_no_pay.dart';

import 'package:zjsb_app/http/http_utils.dart';

import 'package:zjsb_app/util/toast.dart';

import 'package:zjsb_app/page/login/provider/user_info.dart';

Future<void> main() async {
//  debugProfileBuildsEnabled = true;
//  debugPaintLayerBordersEnabled = true;
//  debugProfilePaintsEnabled = true;
//  debugRepaintRainbowEnabled = true;

//webview加载

  _initWebView();
  WidgetsFlutterBinding.ensureInitialized();
  // //高德api初始化
  // AMapFlutterLocation.setApiKey(
  //     'f7ac91c19bd5b59b69ee1fb1195b3ee4', '58561b5223ab097bdfa732be15c56125');
  //dio初始化
  HttpUtils.init(
    baseUrl: Constant.baseUrl,
  );

  /// sp初始化
  await SpUtil.getInstance();
  runApp(MyApp());
  // 透明状态栏
  if (Device.isAndroid) {
    final SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

_initFluwx() async {
  await registerWxApi(
    appId: "wxfdcb5967c03dca24",
    doOnAndroid: true,
    doOnIOS: false,
    // universalLink: "",
  );
  var result = await isWeChatInstalled;
  print("is wxApi installed $result");
}

Future<void> _initWebView() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);

    var swAvailable = await AndroidWebViewFeature.isFeatureSupported(
        AndroidWebViewFeature.SERVICE_WORKER_BASIC_USAGE);
    var swInterceptAvailable = await AndroidWebViewFeature.isFeatureSupported(
        AndroidWebViewFeature.SERVICE_WORKER_SHOULD_INTERCEPT_REQUEST);

    if (swAvailable && swInterceptAvailable) {
      AndroidServiceWorkerController serviceWorkerController =
          AndroidServiceWorkerController.instance();

      serviceWorkerController.serviceWorkerClient = AndroidServiceWorkerClient(
        shouldInterceptRequest: (request) async {
          print(request);
          return null;
        },
      );
    }
  }
}

class MyApp extends StatelessWidget {
  final Widget home;
  final ThemeData theme;

  MyApp({this.home, this.theme}) {
    Routes.initRoutes();
    SpUtil.putBool(Constant.isShowNative, false);
    _initFluwx();
  }

  void initDio() {
    final List<Interceptor> interceptors = [];

    /// 统一添加身份验证请求头
    interceptors.add(AuthInterceptor());

    /// 打印Log(生产模式去除)
    if (!Constant.inProduction) {
      interceptors.add(LoggingInterceptor());
    }

    setInitDio(
      baseUrl: Constant.baseUrl,
      interceptors: interceptors,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget app = MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
        ChangeNotifierProvider(create: (_) => UserInfoPrivider())
      ],
      child: Consumer3<ThemeProvider, LocaleProvider, UserInfoPrivider>(
        builder: (_, ThemeProvider provider, LocaleProvider localeProvider,
            UserInfoPrivider userInfoPrivider, __) {
          return _buildMaterialApp(
              context, provider, localeProvider, userInfoPrivider);
        },
      ),
    );

    /// Toast 配置
    return OKToast(
        child: app,
        backgroundColor: Colors.black54,
        textPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        radius: 20.0,
        position: ToastPosition.bottom);
  }

  Widget _buildMaterialApp(BuildContext context, ThemeProvider provider,
      LocaleProvider localeProvider, UserInfoPrivider userInfoPrivider) {
    final easyload = EasyLoading.init();
    EasyLoading.instance..userInteractions = false; //loading 禁止操作
    return ScreenUtilInit(
        designSize: Size(375, 667),
        builder: () => MaterialApp(
              color: Colors.red,
              title: '证件识别',
//    showPerformanceOverlay: true, //显示性能标签
              debugShowCheckedModeBanner: false, // 去除右上角debug的标签
//    checkerboardRasterCacheImages: true,
//    showSemanticsDebugger: true, // 显示语义视图
//    checkerboardOffscreenLayers: true, // 检查离屏渲染
              theme: theme ?? provider.getTheme(),
              darkTheme: provider.getTheme(isDarkMode: true),
              themeMode: provider.getThemeMode(),
              home: _goLogin(context),
              onGenerateRoute: Routes.router.generator,
              localizationsDelegates: [
                PickerLocalizationsDelegate.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                S.delegate
              ],
              supportedLocales: S.delegate.supportedLocales,
              locale: localeProvider.locale,
              builder: (context, child) {
                child = easyload(context, child);

                /// 保证文字大小不受手机系统设置影响 https://www.kikt.top/posts/flutter/layout/dynamic-text/
                child = MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: child,
                );

                return child;
              },
              // ignore: missing_return
              localeResolutionCallback: (deviceLocale, supportedLocales) {
                //print('deviceLocale: $deviceLocale ${localeProvider.locale}');
                //print(deviceLocale.toString() == 'zh_CN');

                // ignore: unrelated_type_equality_checks
                if (deviceLocale.toString() == 'zh_CN') {
                  //中文
                  // localeProvider.setLocale('en');
                  SpUtil.putString(Constant.localeNumber, 'zh');
                } else {
                  //英文
                  SpUtil.putString(Constant.localeNumber, 'en');
                }
              },

              /// 因为使用了fluro，这里设置主要针对Web
              onUnknownRoute: (_) {
                return MaterialPageRoute(
                  builder: (BuildContext context) => NotFoundPage(),
                );
              },
            ));
  }

  Widget _goLogin(BuildContext context) {
    String token = SpUtil.getString(Constant.token, defValue: "");
    if (token.isEmpty) {
      return TabPage();
    } else {
      return TabPage();
    }
  }
}
