import 'package:flutter/material.dart';
import 'package:zjsb_app/generated/l10n.dart';
import 'package:zjsb_app/page/home/widget/home_line_xu.dart';
import 'package:zjsb_app/res/colors.dart';
import 'package:zjsb_app/res/gaps.dart';
import 'package:zjsb_app/util/color_utils.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTimeWidget extends StatefulWidget {
  HomeTimeWidget(this.t1, this.t2, this.t3, this.t4);
  final String t1;
  final String t2;
  final String t3;
  final String t4;
  @override
  _HomeTimeWidgetState createState() => _HomeTimeWidgetState();
}

class _HomeTimeWidgetState extends State<HomeTimeWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              color: ColorUtils.getThemeColor(),
              width: 4.w,
              height: 16.w,
            ),
            Gaps.hGap8,
            Text("${S.of(context).hm_tab_ccgz}")
                .fontSize(14.sp)
                .textColor(ColorUtils.get2828Color(context))
                .bold()
          ],
        ),
        Gaps.vGap10,
        Row(
          children: [
            Container(
              width: 70.w,
              child: Text(widget.t1)
                  .fontSize(12.sp)
                  .textColor(Colours.dark_gray_text_color),
            ),
            Container(
              width: 40.w,
            ),
            Container(
              width: 70.w,
              child: Text(widget.t2)
                  .fontSize(12.sp)
                  .textColor(Colours.dark_gray_text_color),
            ),
            Expanded(
              flex: 2,
              child: Container(),
            ),
            Container(
              alignment: Alignment.centerRight,
              width: 120.w,
              child: Text(widget.t3)
                  .fontSize(12.sp)
                  .textColor(Colours.home_bg_orange_),
            ),
          ],
        ),
        Gaps.vGap5,
        Row(
          children: [
            Container(
              width: 100.w,
              child: Text("${S.of(context).hm_tab_gmr}")
                  .fontSize(12.sp)
                  .textColor(ColorUtils.get2828Color(context).withOpacity(0.8))
                  .fontWeight(FontWeight.w600),
            ),
            Container(
              width: 10.w,
            ),
            Container(
              width: 70.w,
              child: Text("${S.of(context).hm_tab_sjsj}")
                  .fontSize(12.sp)
                  .textColor(ColorUtils.get2828Color(context).withOpacity(0.8))
                  .fontWeight(FontWeight.w600),
            ),
            Expanded(
              flex: 2,
              child: Container(),
            ),
            Container(
              alignment: Alignment.centerRight,
              width: 120.w,
              child: Text(widget.t4)
                  .fontSize(12.sp)
                  .textColor(Colours.home_bg_orange_)
                  .fontWeight(FontWeight.w600),
            ),
          ],
        ),
        Gaps.vGap12,
        Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipOval(
                  child: Container(
                    width: 12.w,
                    height: 12.w,
                    color: ColorUtils.getThemeColor().withOpacity(0.2),
                  ),
                ),
                ClipOval(
                  child: Container(
                    width: 10.w,
                    height: 10.w,
                    color: ColorUtils.getThemeColor().withOpacity(0.5),
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 1,
              child: HomeLineXu(
                width: 5.w,
                height: 5.w,
                count: 12,
                color: ColorUtils.getThemeColor().withOpacity(0.3),
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                ClipOval(
                  child: Container(
                    width: 12.w,
                    height: 12.w,
                    color: ColorUtils.getThemeColor().withOpacity(0.5),
                  ),
                ),
                ClipOval(
                  child: Container(
                    width: 10.w,
                    height: 10.w,
                    color: ColorUtils.getThemeColor().withOpacity(0.8),
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 2,
              child: HomeLineXu(
                width: 5.w,
                height: 5.w,
                count: 25,
                color: ColorUtils.getThemeColor().withOpacity(0.6),
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                ClipOval(
                  child: Container(
                    width: 12.w,
                    height: 12.w,
                    color: ColorUtils.getThemeColor().withOpacity(0.5),
                  ),
                ),
                ClipOval(
                  child: Container(
                    width: 10.w,
                    height: 10.w,
                    color: ColorUtils.getThemeColor().withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
