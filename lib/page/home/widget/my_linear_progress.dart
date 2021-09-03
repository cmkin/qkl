import 'package:flutter/material.dart';

class MyLinearProgress extends StatelessWidget {
  MyLinearProgress(this.p,this.pColor);
  double p;
  Color pColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //限制进度条的高度
      height: 4,
      //限制进度条的宽度
      child: ClipRRect(
        borderRadius:
        BorderRadius.all(Radius.circular(10.0)),
        child: new LinearProgressIndicator(
          //0~1的浮点数，用来表示进度多少;如果 value 为 null 或空，则显示一个动画，否则显示一个定值
          value: p,
          //背景颜色
          backgroundColor:
          pColor.withOpacity(0.2),
          //进度颜色
          valueColor: new AlwaysStoppedAnimation<Color>(
              pColor.withOpacity(0.9)),
        ),
      ),
    );
  }
}
