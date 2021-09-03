import 'package:flutter/cupertino.dart';
import 'package:zjsb_app/res/resources.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleText extends StatefulWidget {
  final String titleStr;
  final String subStr;
  TitleText({Key key, this.titleStr, this.subStr}) : super(key: key);
  @override
  _TitleTextState createState() => _TitleTextState();
}

class _TitleTextState extends State<TitleText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          SizedBox(
            width: 100.w,
            child: Text(
              widget.titleStr,
              style: TextStyles.get6565TextStyle(context),
            ),
          ),
          Gaps.hGap12,
          Text(
            widget.subStr,
            style: TextStyles.get2828TextStyle(context),
          ).fontSize(13.sp),
        ],
      ),
    );
  }
}
