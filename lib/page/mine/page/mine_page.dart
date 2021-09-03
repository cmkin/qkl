import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zjsb_app/generated/l10n.dart';
import 'package:zjsb_app/page/home/widget/pinfo_image.dart';
import 'package:zjsb_app/page/login/page/login_page.dart';
import 'package:zjsb_app/page/mine/page/invite_friends_page.dart';
import 'package:zjsb_app/page/mine/page/order/my_order_page.dart';
import 'package:zjsb_app/page/mine/page/services/mine_services.dart';
import 'package:zjsb_app/page/mine/page/wallet/wallet.dart';
import 'package:zjsb_app/page/mine/widget/mine_image_text_btn.dart';
import 'package:zjsb_app/page/mine/widget/mine_image_text_go_btn.dart';
import 'package:zjsb_app/page/mine/widget/mine_kefu_weixin_dialog.dart';
import 'package:zjsb_app/res/colors.dart';
import 'package:zjsb_app/res/dimens.dart';
import 'package:zjsb_app/res/gaps.dart';
import 'package:zjsb_app/util/color_utils.dart';
import 'package:zjsb_app/util/image_utils.dart';
import 'package:zjsb_app/widgets/my_button.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zjsb_app/widgets/oktoast_expand.dart';
import 'package:zjsb_app/widgets/webview/web_title_page.dart';

import 'about_us_page.dart';
import 'account_safety/account_safety_page.dart';
import 'account_settings/account_settings_page.dart';
import 'identity_authentication_page.dart';
import 'language_page.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  bool isShow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.getGrayWhiteBgColor(context),
      body: Column(
        children: [
          Expanded(
              child: CustomScrollView(
            slivers: [
              //头部人员信息，余额

              SliverAppBar(
                backgroundColor: ColorUtils.getThemeColor(),
                title: Column(
                  // alignment: Alignment.center,
                  children: [
                    Row(
                      children: [
                        ClipOval(
                            child: PInfoImage(
                          url: "icon_uesr_default",
                          size: 28,
                        )),
                        Gaps.hGap10,
                        Column(
                          children: [
                            Text("用户昵称").fontSize(14).textColor(Colors.white),
                            Gaps.vGap5,
                            Text("177***99999")
                                .fontSize(10)
                                .textColor(Colors.white),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                actions: <Widget>[
                  new IconButton(
                    icon: ImageIcon(ImageUtils.getAssetImage("mine_kefu"),
                        size: 16, color: Colors.white),
                    onPressed: () {
                      print("联系客服");
                      showDialog<void>(
                          context: context,
                          builder: (_) => Dialog(
                              backgroundColor: Colors.transparent,
                              child: MineKefuWeixinDialog()));
                    },
                  ),
                  new IconButton(
                    icon: ImageIcon(ImageUtils.getAssetImage("mine_setting"),
                        size: 20, color: Colors.white),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AccountSettingPage(),
                        ),
                      );
                      print("设置");
                    },
                  ),
                ],
                pinned: true,
                //展开的高度
                expandedHeight: 80,
                flexibleSpace: FlexibleSpaceBar(

                    // background: Stack(
                    //   alignment: AlignmentDirectional.bottomEnd,
                    //   children: [
                    //     Container(
                    //       height: 236,
                    //       decoration: BoxDecoration(
                    //         // 线性渐变
                    //         gradient: LinearGradient(
                    //           colors: [
                    //             Colors.white.withOpacity(0.2),
                    //             ColorUtils.getThemeColor().withOpacity(1)
                    //           ],
                    //           begin: Alignment.bottomCenter,
                    //           end: Alignment.topCenter,
                    //         ),
                    //       ),
                    //     ),
                    //     Container(
                    //       padding: EdgeInsets.only(
                    //         left: Dimens.gap_dp12,
                    //         right: Dimens.gap_dp12,
                    //         top: Dimens.gap_dp10,
                    //       ),
                    //       height: 120,
                    //       width: double.infinity,
                    //       child: Column(
                    //         children: [
                    //           //余额
                    //           Container(
                    //             height: 34,
                    //             padding: EdgeInsets.only(left: 12, right: 0),
                    //             decoration: BoxDecoration(
                    //               color: Colours.gray_white_color,
                    //               borderRadius: const BorderRadius.only(
                    //                   topLeft: Radius.circular(8.0),
                    //                   topRight: Radius.circular(8.0)),
                    //             ),
                    //             child: Row(
                    //               children: [
                    //                 Text("${S.of(context).mi_ye}")
                    //                     .fontSize(11)
                    //                     .textColor(Colours.gray_text_color),
                    //                 Text(isShow?"1688.00 USDT":"****")
                    //                     .fontSize(16)
                    //                     .textColor(
                    //                         ColorUtils.get2828Color(context))
                    //                     .fontWeight(FontWeight.w800),
                    //                 Expanded(
                    //                   child: Text(isShow?" ≈3899 CNY":"")
                    //                       .fontSize(11)
                    //                       .textColor(
                    //                           Colours.dark_gray_text_color),
                    //                 ),
                    //                 IconButton(
                    //                     icon: ImageIcon(
                    //                       ImageUtils.getAssetImage(isShow?"mine_eye":"mine_eye_close"),
                    //                       size: 16,
                    //                       color: Colours.dark_gray_text_color,
                    //                     ),
                    //                     onPressed: () {
                    //                       setState(() {
                    //                         if (isShow) {
                    //                           isShow = false;
                    //                         } else {
                    //                           isShow = true;
                    //                         }
                    //                       });

                    //                       print("查看余额");
                    //                     }),
                    //               ],
                    //             ),
                    //           ),
                    //           Gaps.vGap24,
                    //           Row(
                    //             children: [
                    //               Expanded(
                    //                 child: Column(
                    //                   children: [
                    //                     Text("0.00 USDT")
                    //                         .fontSize(15)
                    //                         .textColor(Colors.white)
                    //                         .fontWeight(FontWeight.w500),
                    //                     Text("${S.of(context).mi_yqjl}")
                    //                         .fontSize(11)
                    //                         .textColor(Colors.white),
                    //                   ],
                    //                   crossAxisAlignment:
                    //                       CrossAxisAlignment.center,
                    //                 ),
                    //               ),
                    //               Container(
                    //                 height: 18,
                    //                 width: 0.5,
                    //                 color: Colors.white,
                    //               ),
                    //               Expanded(
                    //                 child: Column(
                    //                   children: [
                    //                     Text("0.00 USDT")
                    //                         .fontSize(15)
                    //                         .textColor(Colors.white)
                    //                         .fontWeight(FontWeight.w500),
                    //                     Text("${S.of(context).mi_ccsy}")
                    //                         .fontSize(11)
                    //                         .textColor(Colors.white),
                    //                   ],
                    //                   crossAxisAlignment:
                    //                       CrossAxisAlignment.center,
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),

                    ),
              ),
              //我的订单，邀请，充值，提现
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    MineImageTextBtn(
                      "mine_qianbao",
                      "${S.of(context).mi_qb}",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => wallet(),
                          ),
                        );
                      },
                    ),
                    MineImageTextBtn(
                      "mine_order",
                      "${S.of(context).mi_wddd}",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyOrderPage(),
                          ),
                        );
                      },
                    ),
                    // MineImageTextBtn(
                    //   "mine_tixian",
                    //   "${S.of(context).mi_tx}",
                    //   onPressed: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => RechargePage(
                    //           viewType: 2,
                    //         ),
                    //       ),
                    //     );
                    //   },
                    // ),
                    // MineImageTextBtn(
                    //   "mine_chongzhi",
                    //   "${S.of(context).mi_cz}",
                    //   onPressed: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => RechargePage(),
                    //       ),
                    //     );
                    //   },
                    // ),
                    MineImageTextBtn(
                      "mine_friend",
                      "${S.of(context).mi_yqhy}",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InviteFriendsPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Gaps.vGap10,
                      MineGoBtn(
                        "mine_id",
                        "${S.of(context).mi_sfrz}",
                        onPressed: () {
                          print("身份认证");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  IdentityAuthenticationPage(),
                            ),
                          );
                        },
                      ),
                      Gaps.line,
                      MineGoBtn(
                        "mine_anquan",
                        "${S.of(context).mi_zhaq}",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AccountSafetyPage(),
                            ),
                          );
                          print("账户安全");
                        },
                      ),
                      Gaps.vGap10,
                    ],
                  ),
                ),
              ),
              //列表功能
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      MineGoBtn(
                        "mine_kefu_gary",
                        "${S.of(context).mi_lxkf}",
                        onPressed: () {
                          print("联系客服");
                          showDialog<void>(
                              context: context,
                              builder: (_) => Dialog(
                                  backgroundColor: Colors.transparent,
                                  child: MineKefuWeixinDialog()));
                        },
                      ),
                      Gaps.line,
                      MineGoBtn(
                        "mine_update",
                        "${S.of(context).mi_bbgx}",
                        onPressed: () {
                          print("版本更新");
                        },
                      ),
                      Gaps.line,
                      MineGoBtn(
                        "mine_about",
                        "${S.of(context).mi_gywm}",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AboutUsPage(),
                            ),
                          );
                          print("关于我们");
                        },
                      ),
                      Gaps.line,
                      MineGoBtn(
                        "mine_yuyan",
                        "${S.of(context).mi_yyqh}",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LanguagePage(),
                            ),
                          );
                          print("语言切换");
                        },
                      ),
                      Gaps.line,
                      MineGoBtn(
                        "mine_xieyi",
                        "${S.of(context).mi_xizc}",
                        onPressed: () {
                          print("服务协议及隐私政策");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WebTitlePage(
                                  "http://www.baidu.com",
                                  "${S.of(context).mi_xizc}"),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
          //Gaps.vGap12,
          //退出登录
          Container(
            //背景
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            color: ColorUtils.getWhiteBgColor(context),
            child: Container(
              //margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Ink(
                child: InkWell(
                  splashColor: Colours.click_color,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    child: Center(
                      child: Text(
                        '${S.of(context).mi_tudl}',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: ColorUtils.get2828Color(context)),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Gaps.vGap8,
        ],
      ),
    );
  }
}
