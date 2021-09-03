import 'package:flutter/material.dart' hide Router;
import 'package:sp_util/sp_util.dart';
import 'package:zjsb_app/common/common.dart';
import 'package:zjsb_app/res/colors.dart';

import 'theme_utils.dart';

class ColorUtils {
  // 获取主题颜色
  static Color getThemeColor() {
    final String str = SpUtil.getString(Constant.themeColor);
    String themeStr;
    // 判断是否为空
    if (str.isNotEmpty) {
      themeStr = str;
    } else {
      themeStr = 'blaue';
    }
    return themeColorMap[themeStr];
  }



  //  字体 黑色
  static Color get2828Color(BuildContext context) {
    bool isDark = ThemeUtils.isDark(context);
    return isDark ? Colours.dark_text_color : Colours.text_color;
  }

  //  页面 白色 背景颜色
  static Color getWhiteBgColor(BuildContext context) {
    bool isDark = ThemeUtils.isDark(context);
    return isDark ? Colours.dark_white_color : Colours.white_color;
  }

  // 页面 灰白色 背景颜色
  static Color getGrayWhiteBgColor(BuildContext context) {
    bool isDark = ThemeUtils.isDark(context);
    return isDark ? Colours.dark_gray_white_color : Colours.gray_white_color;
  }

  // 页面 灰白色 背景颜色
  static Color getLightBlueColor(BuildContext context) {
    bool isDark = ThemeUtils.isDark(context);
    return isDark ? Colours.dark_light_blue_color : Colours.light_blue_color;
  }

  //  // 深色 线条颜色
  static Color getLineBgColor(BuildContext context) {
    bool isDark = ThemeUtils.isDark(context);
    return isDark ? Colours.dark_line_bg_color : Colours.line_bg_color;
  }

  //   红颜色
  static Color getRedColor(BuildContext context) {
    bool isDark = ThemeUtils.isDark(context);
    return isDark ? Colours.dark_red : Colours.red;
  }

  //   筛选按钮背景颜色
  static Color getFilterBtnBgColor(BuildContext context) {
    bool isDark = ThemeUtils.isDark(context);
    return isDark ? Colours.dark_btn_bg : Colours.btn_bg;
  }
}
