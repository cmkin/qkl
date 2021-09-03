import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zjsb_app/generated/l10n.dart';
import 'package:zjsb_app/page/routers/fluro_navigator.dart';
import 'package:zjsb_app/res/colors.dart';
import 'package:zjsb_app/res/gaps.dart';
import 'package:zjsb_app/util/color_utils.dart';
import 'package:zjsb_app/widgets/load_image.dart';

class MineKefuWeixinDialog extends StatefulWidget {
  @override
  _MineKefuWeixinDialogState createState() => _MineKefuWeixinDialogState();
}

class _MineKefuWeixinDialogState extends State<MineKefuWeixinDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      width: 280,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(18.0)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(child: Container()),
              GestureDetector(
                child: LoadImage(
                  "mine_close",
                  width: 20,
                  height: 20,
                ),
                onTap: (){
                  NavigatorUtils.goBack(context);
                },
              ),
            ],
          ),
          LoadImage(
            "mine_setting",
            width: 120,
            height: 120,
          ),
          Gaps.vGap32,
          Text("${S.of(context).kf_text1}").textColor(Colours.text_color).fontSize(18),
          Gaps.vGap16,
          Text("${S.of(context).kf_text2}").textColor(Colours.gray_text_color).fontSize(14),
        ],
      ),
    );
  }
}
