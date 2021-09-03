import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zjsb_app/util/color_utils.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LabelChip extends StatefulWidget {
  // 背景色
  final Color labBgColor;

  // 文字颜色
  final Color labTextColor;
  final double spac;
  final double runSpac;

  // 数据源  <String>
  final List labList;

  // 圆角
  final double radius;

  LabelChip(
      {Key key,
      this.labBgColor,
      this.labTextColor,
      this.labList,
      this.radius = 2,
      this.spac = 6.0,
      this.runSpac = 0.0})
      : super(key: key);

  @override
  _LabelChipState createState() => _LabelChipState();
}

class _LabelChipState extends State<LabelChip> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: widget.runSpac,
      spacing: widget.spac,
      children: [
        for (String item in widget.labList)
          Container(
            height: 17.w,
            padding:
                EdgeInsets.only(left: 4.w, right: 4.w, top: 2.w, bottom: 2.w),
            decoration: BoxDecoration(
              color: widget.labBgColor == null
                  ? ColorUtils.getThemeColor().withOpacity(0.2)
                  : widget.labBgColor,
              borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
            ),
            child: Text(
              item,
              //style: TextStyle(height: 1.w),
            )
                .textColor(widget.labTextColor == null
                    ? ColorUtils.getThemeColor()
                    : widget.labTextColor)
                .fontSize(10.sp),
          ),
      ],
    );
  }
}
