import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:zjsb_app/generated/l10n.dart';
import 'package:zjsb_app/page/home/widget/home_line_xu.dart';
import 'package:zjsb_app/page/home/widget/pinfo_image.dart';
import 'package:zjsb_app/res/colors.dart';
import 'package:zjsb_app/res/gaps.dart';
import 'package:zjsb_app/util/color_utils.dart';
import 'package:zjsb_app/util/image_utils.dart';
import 'package:zjsb_app/widgets/my_app_bar.dart';
import 'package:zjsb_app/widgets/my_button.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:fluwx_no_pay/fluwx_no_pay.dart';

class InviteFriendsPage extends StatefulWidget {
  @override
  _InviteFriendsPageState createState() => _InviteFriendsPageState();
}

class _InviteFriendsPageState extends State<InviteFriendsPage> {
  int peopleNum = 2;
  int moneyNum = 22;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.getGrayWhiteBgColor(context),
      appBar: MyAppBar(
        centerTitle: "${S.of(context).mi_yqhy}",
      ),
      body: Column(
        children: [
          Expanded(
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 25),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 12),
                              width: double.infinity,
                              height: 240,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12)),
                                image: DecorationImage(
                                  image: ImageUtils.getAssetImage(
                                      "mine_friend_bg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${S.of(context).fr_text1}")
                                      .fontSize(18)
                                      .textColor(Colours.text_color)
                                      .fontWeight(FontWeight.w600),
                                  Gaps.vGap10,
                                  Text("${S.of(context).fr_text2}")
                                      .fontSize(14)
                                      .textColor(Colours.text_gray)
                                      .fontWeight(FontWeight.w600),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(12)),
                              ),
                              child: Center(
                                child: Row(
                                  children: [
                                    Gaps.hGap10,
                                    ClipOval(
                                        child: PInfoImage(
                                      url: "icon_uesr_default",
                                      size: 38,
                                    )),
                                    Gaps.hGap5,
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("用户昵称")
                                              .fontSize(15)
                                              .textColor(
                                                  ColorUtils.get2828Color(
                                                      context))
                                              .fontWeight(FontWeight.w500),
                                          Text("${S.of(context).fr_yqm}:asfasfafa")
                                              .fontSize(13)
                                              .textColor(Colours.text_gray),
                                        ],
                                      ),
                                    ),
                                    QrImage(
                                      data: '邀请二维码地址',
                                      size: 60,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body:Container(
                child: ListView.builder(itemCount:1,itemBuilder: (BuildContext context, int index) {
                    return  Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, bottom: 10, left: 12, right: 12),
                              child: Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 36,
                                    decoration: BoxDecoration(
                                      color: Colours.btn_gary_color.withOpacity(0.3),
                                      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                                    ),
                                    child: Center(
                                        child: Text(
                                            "${S.of(context).fr_yljyq} $peopleNum ${S.of(context).dw_ren}，${S.of(context).mi_yqjl} ${moneyNum} USDT")
                                            .textColor(Colours.text_color)
                                            .fontSize(14)),
                                  ),
                                  Gaps.vGap16,
                                  Row(
                                    children: [
                                      Gaps.hGap32,
                                      Text("${S.of(context).fr_zcsj}")
                                          .fontSize(13)
                                          .textColor(Colours.text_color),
                                      Expanded(child: Container()),
                                      Text("${S.of(context).fr_hysjh}")
                                          .fontSize(13)
                                          .textColor(Colours.text_color),
                                      Gaps.hGap32,
                                    ],
                                  ),
                                  Gaps.vGap5,
                                  HomeLineXu(
                                    width: 5,
                                    height: 1,
                                    count: 30,
                                    color: ColorUtils.getThemeColor().withOpacity(0.3),
                                  ),
                                  Gaps.vGap10,
                                  Container(
                                    height: 40,
                                    child: ListView.builder(itemCount: 12,itemBuilder: (BuildContext context, int index){
                                      return Container(
                                        padding: EdgeInsets.symmetric(vertical: 3),
                                        child: Row(
                                          children: [
                                            Gaps.hGap32,
                                            Text("2021-06-03")
                                                .fontSize(13)
                                                .textColor(Colours.dark_gray_text_color),
                                            Expanded(child: Container()),
                                            Text(" 17777777777 ")
                                                .fontSize(13)
                                                .textColor(Colours.dark_gray_text_color),
                                            Gaps.hGap32,
                                          ],
                                        ),
                                      );
                                    },),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text("${S.of(context).fr_hdgz}").textColor(Colours.text_color).fontSize(15),
                                    Gaps.vGap5,
                                    Gaps.line,
                                    Gaps.vGap5,
                                    Text("${S.of(context).fr_hdgz_text}",maxLines: 100,).textColor(Colours.text_color).fontSize(13),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                }),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
            child: MyButton(
              onPressed: () {
               shareToWeChat(
                    WeChatShareWebPageModel(
                      'https://www.baidu.com',
                        title: "下载地址",
                        description: "点击下载app",
                    thumbnail: WeChatImage.network("https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg001.21cnimg.com%2Fphotos%2Falbum%2F20170826%2Fo%2FF7599535A4A4A2A669F0EAAC63C00814.png&refer=http%3A%2F%2Fimg001.21cnimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1627784642&t=6eee00ef2883a03c01dab0acc86ec6ce"),
                    scene: WeChatScene.SESSION,
                )
                ).then((data) {
                print (data);
                });
              },
              text: "${S.of(context).fr_fx}",
            ),
          )
        ],
      ),
    );
  }
}
