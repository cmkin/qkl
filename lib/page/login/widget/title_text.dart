import 'package:flutter/cupertino.dart';
import 'package:zjsb_app/res/colors.dart';
import 'package:zjsb_app/res/gaps.dart';
import 'package:zjsb_app/res/styles.dart';

class TitleText extends StatelessWidget {
  final String titleStr;
  final String subStr;
  const TitleText({Key key,this.titleStr,this.subStr}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return  // 文字
      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titleStr,
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold ),
            ),
            Gaps.vGap5,
            Text(
              subStr,
              style: TextStyles.get6565TextStyle(context,fontSize: 16),
            ),
          ],
        ),
      );
  }
}
