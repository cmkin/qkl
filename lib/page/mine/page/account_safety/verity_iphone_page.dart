import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zjsb_app/generated/l10n.dart';
import 'package:zjsb_app/page/mine/page/account_safety/verity_code_page.dart';
import 'package:zjsb_app/res/colors.dart';
import 'package:zjsb_app/res/gaps.dart';
import 'package:zjsb_app/res/styles.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zjsb_app/util/color_utils.dart';
import 'package:zjsb_app/widgets/my_button.dart';

class VerityIphonePage extends StatefulWidget {
  // 重置类型  1 登录密码  2 交易密码
  final int type;
  VerityIphonePage({Key key, this.type}) : super(key: key);

  @override
  _VerityIphonePageState createState() => _VerityIphonePageState();
}

class _VerityIphonePageState extends State<VerityIphonePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorUtils.getWhiteBgColor(context),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colours.text_color,
            size: 18,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 1,
        title: Text(
          S.of(context).account_aqyz,
          style: TextStyles.get2828TextStyle(context),
        ).fontSize(16), //.fontWeight(FontWeight.bold),
        centerTitle: true,
      ),
      backgroundColor: ColorUtils.getWhiteBgColor(context),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.only(left: 12, right: 12, top: 10),
              child: Text(
                S.of(context).account_aqyzts,
                style: TextStyles.get6565TextStyle(context),
              ).fontSize(16)),
          Gaps.vGap50,
          Center(
            child: Text(
              '+86' + '123' + '。。。' + '442',
              style: TextStyles.get2828TextStyle(context),
            ).fontWeight(FontWeight.bold),
          ),
          Gaps.vGap50,
          Container(
            margin: EdgeInsets.only(left: 12, right: 12),
            child: MyButton(
              key: const Key('iphone'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VierityCodePage(
                      type: widget.type,
                    ),
                  ),
                );
              },
              text: S.of(context).account_fsyzm,
            ),
          ),
        ],
      ),
    );
  }
}
