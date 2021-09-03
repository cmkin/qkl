import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zjsb_app/generated/l10n.dart';
import 'package:zjsb_app/page/home/widget/pinfo_image.dart';
import 'package:zjsb_app/res/colors.dart';
import 'package:zjsb_app/res/gaps.dart';
import 'package:zjsb_app/res/styles.dart';
import 'package:zjsb_app/util/color_utils.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zjsb_app/util/image_utils.dart';

import 'change_username_page.dart';

class AccountSettingPage extends StatefulWidget {
  @override
  _AccountSettingPageState createState() => _AccountSettingPageState();
}

class _AccountSettingPageState extends State<AccountSettingPage> {
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

        title: Text(
          S.of(context).about_zhsz,
          style: TextStyles.get2828TextStyle(context),
        ).fontSize(16), //.fontWeight(FontWeight.bold),
        centerTitle: true,
      ),
      backgroundColor: ColorUtils.getGrayWhiteBgColor(context),
      body: Column(
        children: [
          // 头像
          GestureDetector(
            onTap: () {},
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
                      S.of(context).about_tx,
                      style: TextStyles.get2828TextStyle(context),
                    ).fontWeight(FontWeight.bold),
                  ),
                  // 头像
                  ClipOval(
                      child: PInfoImage(
                    url: "icon_uesr_default",
                    size: 40,
                  )),
                  Gaps.hGap4,
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
          // 昵称
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChangeUserNamePage(),
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
                      S.of(context).about_nc,
                      style: TextStyles.get2828TextStyle(context),
                    ).fontWeight(FontWeight.bold),
                  ),
                  Text(
                    '我是昵称',
                    style: TextStyles.get6565TextStyle(context),
                  ),
                  Gaps.hGap4,
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
          // 登录手机号
          GestureDetector(
            onTap: () {},
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
                      S.of(context).about_dlsjh,
                      style: TextStyles.get2828TextStyle(context),
                    ).fontWeight(FontWeight.bold),
                  ),
                  Text(
                    '177****2424',
                    style: TextStyles.get6565TextStyle(context),
                  ),
                  Gaps.hGap4,
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
