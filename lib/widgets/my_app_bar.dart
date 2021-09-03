import 'package:flutter/material.dart' hide Router;
import 'package:flutter/services.dart';
import 'package:zjsb_app/res/colors.dart';
import 'package:zjsb_app/res/dimens.dart';
import 'package:zjsb_app/res/gaps.dart';
import 'package:zjsb_app/util/color_utils.dart';
import 'package:zjsb_app/util/image_utils.dart';
import 'package:zjsb_app/util/theme_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 自定义AppBar
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar(
      {Key key,
      this.backgroundColor = Colors.white,
      this.titleColor,
      this.title = '',
      this.centerTitle = '',
      this.actionName = '',
      this.actionIcon = '',
      this.backImg = '',
      this.onPressed,
      this.isBack = true,
      this.isShowDivider = true})
      : super(key: key);

  final Color backgroundColor;
  final Color titleColor;
  final String title;
  final String centerTitle;
  final String backImg;
  final String actionName;
  final String actionIcon;
  final VoidCallback onPressed;
  final bool isBack;
  final bool isShowDivider;

  @override
  Widget build(BuildContext context) {
    Color _backgroundColor;

    if (backgroundColor == null) {
      _backgroundColor = Theme.of(context).appBarTheme.color;
    } else {
      _backgroundColor = backgroundColor;
    }

    final SystemUiOverlayStyle _overlayStyle =
        ThemeData.estimateBrightnessForColor(_backgroundColor) ==
                Brightness.dark
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark;

    Widget back = isBack
        ? IconButton(
            onPressed: () {
              FocusManager.instance.primaryFocus?.unfocus();
              Navigator.maybePop(context);
            },
            tooltip: 'Back',
            padding: EdgeInsets.all(12.w),
            icon: backImg == ""
                ? Icon(
                    Icons.arrow_back_ios,
                    color: Colours.appbar_back_color,
                    size: 18.sp,
                  )
                : Image.asset(
                    ImageUtils.getImgPath(backImg),
                    color: ThemeUtils.getIconColor(context),
                  ),
          )
        : Gaps.empty;

    Widget action = actionName.isNotEmpty
        ? Positioned(
            right: 0.0,
            top: 8.w,
            child: Theme(
              data: Theme.of(context).copyWith(
                buttonTheme: ButtonThemeData(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  minWidth: 60.w,
                ),
              ),
              child: FlatButton(
                child: Text(
                  actionName,
                  key: const Key('actionName'),
                  style: TextStyle(fontSize: 16.sp),
                ),
                textColor: ColorUtils.get2828Color(context),
                highlightColor: Colors.transparent,
                onPressed: onPressed,
              ),
            ),
          )
        : Gaps.empty;
    Widget actionImg = actionIcon.isNotEmpty
        ? Positioned(
            right: 0.0,
            child: IconButton(
              onPressed: onPressed,
              padding: EdgeInsets.all(12.w),
              icon: Image.asset(
                ImageUtils.getImgPath(actionIcon),
                color: ThemeUtils.getIconColor(context),
              ),
            ),
          )
        : Gaps.empty;
    Widget titleWidget = Semantics(
      namesRoute: true,
      header: true,
      child: Container(
        height: 46.w,
        alignment:
            centerTitle.isEmpty ? Alignment.centerLeft : Alignment.center,
        width: double.infinity,
        child: Text(
          title.isEmpty ? centerTitle : title,
          style: TextStyle(
            fontSize: 16.sp,
            color: titleColor == null
                ? ColorUtils.get2828Color(context)
                : titleColor,
          ),
        ),
        margin: EdgeInsets.symmetric(horizontal: 48.w),
      ),
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _overlayStyle,
      child: Material(
        color: _backgroundColor,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: <Widget>[
                  titleWidget,
                  back,
                  action,
                  actionImg,
                ],
              ),
              Expanded(child: SizedBox()),
              isShowDivider
                  ? Container(
                      width: double.infinity,
                      height: 0.5,
                      color: ColorUtils.getLineBgColor(context),
                    )
                  : Gaps.empty,
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.w);
}
