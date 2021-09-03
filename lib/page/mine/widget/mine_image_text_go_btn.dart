import 'package:flutter/material.dart';
import 'package:zjsb_app/res/colors.dart';
import 'package:zjsb_app/res/dimens.dart';
import 'package:zjsb_app/res/gaps.dart';
import 'package:zjsb_app/util/color_utils.dart';
import 'package:zjsb_app/widgets/load_image.dart';
import 'package:styled_widget/styled_widget.dart';

class MineGoBtn extends StatefulWidget {
  MineGoBtn(this.image,this.text,{@required this.onPressed,this.message = ""});
  String image;
  String text;
  String message;
  final VoidCallback onPressed;
  @override
  _MineGoBtnState createState() => _MineGoBtnState();
}

class _MineGoBtnState extends State<MineGoBtn> {
  @override
  Widget build(BuildContext context) {
    return Material(
      //背景
      color: ColorUtils.getWhiteBgColor(context),
      child: Ink(
        decoration: new BoxDecoration(
          //设置四周圆角 角度
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ),
        child: InkWell(
          splashColor: Colours.click_color,
          child:Container(
            padding: EdgeInsets.only(left: Dimens.gap_dp12,right: Dimens.gap_dp12,top: Dimens.gap_dp10,bottom: Dimens.gap_dp10),
            child: Row(
              children: [
                LoadImage(widget.image,width: 23,height: 23,),
                Gaps.hGap5,
                Expanded(child: Text(widget.text).fontSize(13).textColor(ColorUtils.get2828Color(context)).fontWeight(FontWeight.w800)),
                LoadImage("mine_go",width: 12,height: 12,),
              ],
            ),
          ),
          onTap: widget.onPressed,
        ),
      ),
    );
  }
}
