import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zjsb_app/generated/l10n.dart';
import 'package:zjsb_app/page/mine/page/account_safety/verity_iphone_page.dart';
import 'package:zjsb_app/res/colors.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zjsb_app/res/gaps.dart';
import 'package:zjsb_app/res/styles.dart';
import 'package:zjsb_app/util/color_utils.dart';
import 'package:zjsb_app/util/image_utils.dart';

class AccountSafetyPage extends StatefulWidget {
  @override
  _AccountSafetyPageState createState() => _AccountSafetyPageState();
}

class _AccountSafetyPageState extends State<AccountSafetyPage> {
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
          S.of(context).account_zhaq,
          style: TextStyles.get2828TextStyle(context),
        ).fontSize(16), //.fontWeight(FontWeight.bold),
        centerTitle: true,
      ),
      backgroundColor: ColorUtils.getGrayWhiteBgColor(context),
      body: Column(
        children: [
          Gaps.vGap16,
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VerityIphonePage(
                    type: 1,
                  ),
                ),
              );
            },
            child: Container(
              height: 50,
              color: ColorUtils.getWhiteBgColor(context),
              padding: EdgeInsets.only(left: 12, right: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      S.of(context).account_zlmm,
                      style: TextStyles.get2828TextStyle(context),
                    ).fontWeight(FontWeight.bold),
                  ),
                  Text(
                    S.of(context).account_cz,
                    style: TextStyles.get6565TextStyle(context),
                  ),
                  Gaps.hGap5,
                  Image(
                    image: ImageUtils.getAssetImage('order_go'),
                    width: 13,
                    height: 13,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 1,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VerityIphonePage(
                    type: 2,
                  ),
                ),
              );
            },
            child: Container(
              height: 50,
              color: ColorUtils.getWhiteBgColor(context),
              padding: EdgeInsets.only(
                left: 12,
                right: 12,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      S.of(context).account_jymm,
                      style: TextStyles.get2828TextStyle(context),
                    ).fontWeight(FontWeight.bold),
                  ),
                  Text(
                    S.of(context).account_cz,
                    style: TextStyles.get6565TextStyle(context),
                  ),
                  Gaps.hGap5,
                  Image(
                    image: ImageUtils.getAssetImage('order_go'),
                    width: 13,
                    height: 13,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
