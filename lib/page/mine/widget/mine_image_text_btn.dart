import 'package:flutter/material.dart';
import 'package:zjsb_app/res/colors.dart';
import 'package:zjsb_app/res/gaps.dart';
import 'package:zjsb_app/util/color_utils.dart';
import 'package:zjsb_app/widgets/load_image.dart';
import 'package:styled_widget/styled_widget.dart';
class MineImageTextBtn extends StatefulWidget {
  MineImageTextBtn(this.image,this.text,{@required this.onPressed});
  String image;
  String text;
  final VoidCallback onPressed;
  @override
  _MineImageTextBtnState createState() => _MineImageTextBtnState();
}

class _MineImageTextBtnState extends State<MineImageTextBtn> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        //背景
        color: ColorUtils.getWhiteBgColor(context),
        child: Ink(
          decoration: new BoxDecoration(
            //设置四周圆角 角度
            borderRadius: BorderRadius.all(Radius.circular(0)),
          ),
          child: InkWell(
            splashColor: Colours.click_color,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 0,vertical: 20),
              child: Column(
                children: [
                  LoadImage(widget.image,width: 28,height: 28,),
                  Text(widget.text).fontSize(12).textColor(Colours.dark_text_gray),
                ],
              ),
            ),
            onTap: widget.onPressed,
          ),
        ),
      ),
    );
  }
}
