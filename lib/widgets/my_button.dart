import 'package:flutter/material.dart' hide Router;
import 'package:zjsb_app/res/colors.dart';
import 'package:zjsb_app/res/dimens.dart';
import 'package:zjsb_app/util/theme_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButton extends StatelessWidget {
  final double btnW;
  final double btnH;
  final double fontSize;
  final bool active;

  const MyButton({
    Key key,
    this.text = '',
    this.btnW = double.infinity,
    this.btnH,
    this.fontSize,
    this.active = true,
    @required this.onPressed,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final bool isDark = ThemeUtils.isDark(context);
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          active ? Colours.btn_bg : Colours.text_gray_c,
        ),
        shape: MaterialStateProperty.all(StadiumBorder(
          side: BorderSide(
            color: Colours.dark_bg_color,
            style: BorderStyle.none,
          ),
        )),
      ),
      child: Container(
        height: btnH ?? 48.w,
        width: btnW,
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
              fontSize: fontSize ?? 18.sp, color: Colours.white_color),
        ),
      ),
    );
  }
}
