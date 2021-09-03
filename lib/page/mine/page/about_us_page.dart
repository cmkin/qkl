import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zjsb_app/generated/l10n.dart';
import 'package:zjsb_app/page/mine/widget/mine_kefu_weixin_dialog.dart';
import 'package:zjsb_app/res/colors.dart';
import 'package:zjsb_app/res/gaps.dart';
import 'package:zjsb_app/res/styles.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zjsb_app/util/color_utils.dart';
import 'package:zjsb_app/util/image_utils.dart';
import 'package:zjsb_app/util/toast.dart';

class AboutUsPage extends StatefulWidget {
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        backgroundColor: ColorUtils.getWhiteBgColor(context),
        title: Text(
          S.of(context).mi_gywm,
          style: TextStyles.get2828TextStyle(context),
        ).fontSize(16), //.fontWeight(FontWeight.bold),
        centerTitle: true,
      ),
      backgroundColor: ColorUtils.getGrayWhiteBgColor(context),
      body: Column(
        children: [
          Container(
            color: ColorUtils.getWhiteBgColor(context),
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 30),
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: Offset(0.0, 3),
                              blurRadius: 2,
                              spreadRadius: 0.5)
                        ]),
                  ),
                ),
                Gaps.vGap24,
                Text(
                  'BITX' + S.of(context).login_cloud_storage,
                  style: TextStyles.get2828TextStyle(context),
                ).fontWeight(FontWeight.bold),
                Gaps.vGap24,
                Container(
                  padding: EdgeInsets.only(left: 12, right: 12),
                  child: Text(
                    '这里平台介绍，这里平台介绍，这里平台介绍，这里平台介绍，这里平台介绍，这里平台介绍，',
                    style: TextStyles.get6565TextStyle(context),
                  ),
                ),
                Gaps.vGap12,
              ],
            ),
          ),
          Gaps.vGap24,
          // 客服电话
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
                      S.of(context).about_kfdh,
                      style: TextStyles.get2828TextStyle(context),
                    ).fontWeight(FontWeight.bold),
                  ),
                  Text(
                    '1314144141',
                    style: TextStyles.get6565TextStyle(context),
                  ),
                  Gaps.hGap5,
                  // Image(image: ImageUtils.getAssetImage('order_go'),width: 13,height: 13,),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 1,
          ),
          // 添加客服微信号
          GestureDetector(
            onTap: () {
              showDialog<void>(
                  context: context,
                  builder: (_) => Dialog(
                      backgroundColor: Colors.transparent,
                      child: MineKefuWeixinDialog()));
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
                      S.of(context).about_tjkfwxh,
                      style: TextStyles.get2828TextStyle(context),
                    ).fontWeight(FontWeight.bold),
                  ),
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
