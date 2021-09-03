import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:zjsb_app/generated/l10n.dart';
import 'package:zjsb_app/page/home/widget/tab/show_buy.dart';
import 'package:zjsb_app/page/home/widget/tab/label_chip.dart';
import 'package:zjsb_app/page/home/widget/tab/title_text.dart';
import 'package:zjsb_app/page/login/page/login_page.dart';
import 'package:zjsb_app/page/order/page/order_data.dart';
import 'package:zjsb_app/res/resources.dart';
import 'package:zjsb_app/util/color_utils.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zjsb_app/util/image_utils.dart';
import 'package:zjsb_app/widgets/load_image.dart';
import 'package:zjsb_app/widgets/my_button.dart';
import 'package:zjsb_app/widgets/swiper/swiper_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabTwoPage extends StatefulWidget {
  @override
  _TabOnePageState createState() => _TabOnePageState();
}

class _TabOnePageState extends State<TabTwoPage> {
  List<String> swiperList = [
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Ft2cy.com%2Fd%2Ffile%2Fphone%2Flist%2Fpic%2F2019-11-12%2F022874178abcf489dd70f18897be09e8.jpg&refer=http%3A%2F%2Ft2cy.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1626572511&t=4720ee813f0d4439e25deaac44a79809",
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Ft2cy.com%2Fd%2Ffile%2Fphone%2Flist%2Fpic%2F2019-11-12%2Fce990c79782d49dcba427cc1a16145b6.jpg&refer=http%3A%2F%2Ft2cy.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1626572558&t=52540e6031a1e2a6002e54e895a3ca5f",
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic.jj20.com%2Fup%2Fallimg%2F1113%2F060320112631%2F200603112631-5-1200.jpg&refer=http%3A%2F%2Fpic.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1626575426&t=056297555e223818c83dc5d465e00ba1",
    "https://img1.baidu.com/it/u=1575169871,3281166747&fm=26&fmt=auto&gp=0.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.getWhiteBgColor(context),
      body: Column(
        children: [
          Expanded(
              child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: ColorUtils.getThemeColor(),
                title: Text(S.of(context).tab2_title).textColor(Colors.white),
                centerTitle: true,
                leading: new IconButton(
                  tooltip: '返回上一页',
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 18.sp,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                pinned: true,
                // //展开的高度
                expandedHeight: 200.w,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      SwiperWidget(
                        swiperList,
                        isShowBottom: true,
                        height: 264.w,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12)),
                        ),
                        width: double.infinity,
                        height: 15.w,
                      ),
                    ],
                  ),
                ),
              ),
              //
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 标题 价格
                      Text.rich(TextSpan(children: [
                        TextSpan(
                                text: '600.9',
                                style: TextStyles.get2828TextStyle(context))
                            .fontWeight(FontWeight.bold)
                            .fontSize(18.sp),
                        TextSpan(
                                text: ' USDT',
                                style: TextStyles.get2828TextStyle(context))
                            .fontSize(13.sp),
                        TextSpan(
                            text: '/4085 CNY',
                            style: TextStyles.get6565TextStyle(context)),
                      ])),
                      Gaps.vGap5,
                      // 标签
                      LabelChip(
                        labList: [
                          '343442',
                          '掌握',
                          '掌握文档发我',
                          '掌握我我我',
                          '掌握我我我我佛我'
                        ],
                      ),
                      Gaps.vGap5,
                      //
                      Text('IPFS独享算力 (3T)',
                              style: TextStyles.get2828TextStyle(context))
                          .fontWeight(FontWeight.bold),
                      //
                      Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Container(
                                height: 80.w,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '3 TiB',
                                      style:
                                          TextStyles.get2828TextStyle(context),
                                    ).fontWeight(FontWeight.bold),
                                    Text(
                                      S.of(context).tab2_item_cpsb,
                                      style:
                                          TextStyles.get6565TextStyle(context),
                                    ),
                                  ],
                                ),
                              )),
                          Gaps.hGap5,
                          Container(
                            height: 20.w,
                            width: 1,
                            color: Colours.dark_gray_text_color,
                            child: Gaps.line,
                          ),
                          Gaps.hGap5,
                          Expanded(
                              flex: 1,
                              child: Container(
                                height: 80.w,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'BZZ',
                                      style:
                                          TextStyles.get2828TextStyle(context),
                                    ).fontWeight(FontWeight.bold),
                                    Text(
                                      S.of(context).tab2_item_cpb,
                                      style:
                                          TextStyles.get6565TextStyle(context),
                                    ),
                                  ],
                                ),
                              )),
                          Gaps.hGap5,
                          Container(
                            height: 20.w,
                            width: 1,
                            color: Colours.dark_gray_text_color,
                            child: Gaps.line,
                          ),
                          Gaps.hGap5,
                          Expanded(
                              flex: 1,
                              child: Container(
                                height: 80.w,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '540天+540天',
                                      style:
                                          TextStyles.get2828TextStyle(context),
                                    ).fontWeight(FontWeight.bold),
                                    Text(
                                      S.of(context).tab2_item_cpsb,
                                      style:
                                          TextStyles.get6565TextStyle(context),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                      //
                      Container(
                        padding: EdgeInsets.only(left: 12.w),
                        color: ColorUtils.getThemeColor().withOpacity(0.1),
                        width: double.infinity,
                        height: 30.w,
                        alignment: Alignment.centerLeft,
                        child: Text.rich(TextSpan(children: [
                          TextSpan(
                                  text: S.of(context).tab2_yjcc + ':',
                                  style: TextStyles.get6565TextStyle(context))
                              .fontSize(12.sp),
                          TextSpan(
                              text: ' 请参考相应节点计算产出',
                              style: TextStyles.get6565TextStyle(context)),
                        ])),
                      ),
                    ],
                  ),
                ),
              ),
              // 产品规格
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).tab2_cpgg,
                        style: TextStyles.get2828TextStyle(context),
                      ).fontWeight(FontWeight.bold),
                      Gaps.vGap10,
                      TitleText(
                          titleStr: S.of(context).tab2_all_devices + ':',
                          subStr: '分布式存储服务器'),
                      Gaps.vGap5,
                      TitleText(
                          titleStr: S.of(context).tab2_yxkj + ':',
                          subStr: '100%'),
                      Gaps.vGap5,
                      TitleText(
                          titleStr: S.of(context).tab2_ckjdh + ':',
                          subStr: 'f24023'),
                      Gaps.vGap5,
                      TitleText(
                          titleStr: S.of(context).tab2_jsfwf + ':',
                          subStr: '20%'),
                      Gaps.vGap5,
                      TitleText(
                          titleStr: S.of(context).tab2_scjgf + ':',
                          subStr: '首次免费'),
                      Gaps.vGap5,
                      TitleText(
                          titleStr: S.of(context).tab2_xcjgf + ':',
                          subStr: '0'),
                      Gaps.vGap5,
                      TitleText(
                          titleStr: S.of(context).tab2_launch_time + ':',
                          subStr: '3 ' + S.of(context).dw_tian),
                      Gaps.vGap5,
                      TitleText(
                          titleStr: S.of(context).tab2_surplus + ':',
                          subStr: '3 ' + S.of(context).dw_fen),
                    ],
                  ),
                ),
              ),
              // 产品详情
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).tab2_title,
                        style: TextStyles.get2828TextStyle(context),
                      ).fontWeight(FontWeight.bold),
                      Gaps.vGap8,
                      Text('产品图片及介绍，由后台添加商品时填写，云设备/联合设备'),
                    ],
                  ),
                ),
              ),
              // 图片
              SliverPadding(
                padding: EdgeInsets.only(top: 10.w),
                sliver: SliverFixedExtentList(
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.only(
                            left: 20.w, right: 20.w, top: 5.w, bottom: 5.w),
                        child: LoadImage(
                          'home_hint',
                          width: 1.sw - 40.w,
                        ),
                      );
                    }, childCount: 3),
                    itemExtent: 110.w),
              ),
            ],
          )),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: MyButton(
              key: const Key('login'),
              onPressed: _login,
              text: S.of(context).tab2_buy_now,
            ),
          ),
          Gaps.vGap15,
        ],
      ),
    );
  }

  void _login() {
    ShowBuy.instance.show(context, 2, (data) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OrderDataPage(),
        ),
      );
    });
  }
}
