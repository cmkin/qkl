import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:sp_util/sp_util.dart';
import 'package:zjsb_app/common/common.dart';
import 'package:zjsb_app/page/routers/web_page_transitions.dart';
import 'package:zjsb_app/res/colors.dart';
import 'package:zjsb_app/res/styles.dart';
import 'package:zjsb_app/util/color_utils.dart';

extension ThemeModeExtension on ThemeMode {
  String get value => <String>['System', 'Light', 'Dark'][index];
}

class ThemeProvider extends ChangeNotifier {
  // 同步深色模式
  void syncTheme() {
    final String theme = SpUtil.getString(Constant.theme);
    if (theme.isNotEmpty && theme != ThemeMode.system.value) {
      notifyListeners();
    }
  }

  // 通过方法手动改变深色模式
  void setTheme(ThemeMode themeMode) {
    SpUtil.putString(Constant.theme, themeMode.value);
    notifyListeners();
  }

  ThemeMode getThemeMode() {
    final String theme = SpUtil.getString(Constant.theme);
    switch (theme) {
      case 'Dark':
        return ThemeMode.dark;
      case 'Light':
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }

  //本地注入主题key
  void setThemeColor(String themeColor) {
    SpUtil.putString(Constant.themeColor, themeColor);
    notifyListeners();
  }

  //判断是否显示原生页面，把首页覆盖一层黑色
  void setIsShowNative(bool isShow) {
    SpUtil.putBool(Constant.isShowNative, isShow);
    notifyListeners();
  }

  bool getIsShowNative() {
    return SpUtil.getBool(Constant.isShowNative, defValue: false);
  }

  ThemeData getTheme({bool isDarkMode = false}) {
    return ThemeData(
      // 错误颜色
      errorColor: isDarkMode ? Colours.dark_red : Colours.red,
      // 亮度
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      // 应用程序主要部分的背景颜色(toolbars、tab bars 等)
      primaryColor:
          isDarkMode ? Colours.dark_white_color : ColorUtils.getThemeColor(),
      //  小部件的前景色(旋钮、文本、覆盖边缘效果等)。
      accentColor:
          isDarkMode ? Colours.dark_app_main : ColorUtils.getThemeColor(),
      // Tab指示器颜色
      indicatorColor: isDarkMode ? Colours.dark_app_main : Colours.app_main,
      // 页面 白色 背景色
      scaffoldBackgroundColor:
          isDarkMode ? Colours.dark_white_color : Colours.white_color,
      // 主要用于Material背景色
      canvasColor: isDarkMode ? Colours.dark_material_bg : Colors.white,
      // 文字选择色（输入框复制粘贴菜单）
      textSelectionColor: Colours.app_main.withAlpha(70),
      textSelectionHandleColor: Colours.app_main,
      textTheme: TextTheme(
        // TextField输入文字颜色
        subtitle1: isDarkMode ? TextStyles.textDark : TextStyles.text,
        // Text文字样式
        bodyText2: isDarkMode ? TextStyles.textDark : TextStyles.text,
        subtitle2:
            isDarkMode ? TextStyles.textDarkGray12 : TextStyles.textGray12,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle:
            isDarkMode ? TextStyles.textHint14 : TextStyles.textDarkGray14,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        // 导航栏 主题 颜色
        color: isDarkMode ? Colours.dark_white_color : Colours.appbar_color,
        // 状态栏
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
      ),
      dividerTheme: DividerThemeData(
          color: isDarkMode ? Colours.dark_line : Colours.line,
          space: 0.6,
          thickness: 0.6),
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
      ),
      pageTransitionsTheme: NoTransitionsOnWeb(),
    );
  }
}
