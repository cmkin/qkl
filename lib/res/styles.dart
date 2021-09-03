import 'package:flutter/material.dart' hide Router;
import 'package:flutter/widgets.dart';
import 'package:zjsb_app/util/theme_utils.dart';
import 'colors.dart';
import 'dimens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  // 设置
  static TextStyle get2828TextStyle(BuildContext context,
      {double fontSize,
      Color color = Colours.text_color,
      FontWeight fontWeight = FontWeight.normal}) {
    bool isDark = ThemeUtils.isDark(context);
    return TextStyle(
        fontSize: fontSize ?? 16.sp,
        color: isDark ? Colours.dark_text_color : color,
        fontWeight: fontWeight);
  }

  // 设置
  static TextStyle get6565TextStyle(BuildContext context,
      {double fontSize,
      Color color = Colours.gray_text_color,
      FontWeight fontWeight = FontWeight.normal}) {
    bool isDark = ThemeUtils.isDark(context);
    return TextStyle(
        fontSize: fontSize ?? 13.sp,
        color: isDark ? Colours.dark_gray_text_color : color,
        fontWeight: fontWeight);
  }

  // 设置
  static TextStyle get9898TextStyle(BuildContext context,
      {double fontSize,
      Color color = Colours.dark_gray_text_color,
      FontWeight fontWeight = FontWeight.normal}) {
    bool isDark = ThemeUtils.isDark(context);
    return TextStyle(
        fontSize: fontSize ?? 13.sp,
        color: isDark ? Colours.dark_gray_text_color : color,
        fontWeight: fontWeight);
  }

  // 设置  (b8b8b8)
  static TextStyle getGrayTextStyle(BuildContext context,
      {double fontSize,
      Color color = Colours.ligGray_text_color,
      FontWeight fontWeight = FontWeight.normal}) {
    bool isDark = ThemeUtils.isDark(context);
    return TextStyle(
        fontSize: fontSize ?? 13.sp,
        color: isDark ? Colours.dark_ligGray_text_color : color,
        fontWeight: fontWeight);
  }

  // 字体 16号 粗体
  static TextStyle textBold16 =
      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold);
  // 字体 12号
  static TextStyle textSize12 = TextStyle(
    fontSize: 12.sp,
  );
  // 字体 16号 带颜色 粗体
  static TextStyle textBC16 = TextStyle(
      fontSize: 16.sp, color: Colours.text_color, fontWeight: FontWeight.bold);
  // 粗黑 16号 带颜色 粗体  深色
  static TextStyle textBCDark16 = TextStyle(
      fontSize: 16.sp,
      color: Colours.dark_text_color,
      fontWeight: FontWeight.bold);

  // 设置自己想要字体样式
  static TextStyle getTextStyle(double fontSize, Color color,
      {FontWeight fontWeight = FontWeight.normal}) {
    return TextStyle(
        fontSize: fontSize.sp, color: color, fontWeight: fontWeight);
  }

  static TextStyle textSize16 = TextStyle(
    fontSize: 16.sp,
  );

  static TextStyle textBold14 =
      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold);

  static TextStyle textBold18 =
      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold);
  static TextStyle textBold24 =
      TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold);
  static TextStyle textBold26 =
      TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold);

  static TextStyle textGray14 = TextStyle(
    fontSize: 14.sp,
    color: Colours.text_gray,
  );
  static TextStyle textDarkGray14 = TextStyle(
    fontSize: 14.sp,
    color: Colours.dark_text_gray,
  );

  static TextStyle textWhite14 = TextStyle(
    fontSize: 14.sp,
    color: Colors.white,
  );

  static TextStyle text = TextStyle(
      fontSize: 14.sp,
      color: Colours.text,
      // https://github.com/flutter/flutter/issues/40248
      textBaseline: TextBaseline.alphabetic);
  static TextStyle textDark = TextStyle(
      fontSize: 14.sp,
      color: Colours.dark_text,
      textBaseline: TextBaseline.alphabetic);

  static TextStyle textGray12 = TextStyle(
      fontSize: 12.sp, color: Colours.text_gray, fontWeight: FontWeight.normal);
  static TextStyle textDarkGray12 = TextStyle(
      fontSize: 12.sp,
      color: Colours.dark_text_gray,
      fontWeight: FontWeight.normal);

  static TextStyle textHint14 =
      TextStyle(fontSize: 14.sp, color: Colours.dark_unselected_item_color);
}
