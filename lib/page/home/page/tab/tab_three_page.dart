import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:zjsb_app/generated/l10n.dart';
import 'package:zjsb_app/page/home/widget/home_detail_tab.dart';
import 'package:zjsb_app/page/home/widget/home_time_widget.dart';
import 'package:zjsb_app/page/home/widget/my_linear_progress.dart';
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
import 'package:zjsb_app/widgets/webview/web_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'detail/tab_detail_one.dart';
import 'detail/tab_detail_two.dart';

class TabThreePage extends StatefulWidget {
  @override
  _TabOnePageState createState() => _TabOnePageState();
}

class _TabOnePageState extends State<TabThreePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final PageController _pageController = PageController(initialPage: 0);
  List<String> swiperList = [
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Ft2cy.com%2Fd%2Ffile%2Fphone%2Flist%2Fpic%2F2019-11-12%2F022874178abcf489dd70f18897be09e8.jpg&refer=http%3A%2F%2Ft2cy.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1626572511&t=4720ee813f0d4439e25deaac44a79809",
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Ft2cy.com%2Fd%2Ffile%2Fphone%2Flist%2Fpic%2F2019-11-12%2Fce990c79782d49dcba427cc1a16145b6.jpg&refer=http%3A%2F%2Ft2cy.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1626572558&t=52540e6031a1e2a6002e54e895a3ca5f",
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic.jj20.com%2Fup%2Fallimg%2F1113%2F060320112631%2F200603112631-5-1200.jpg&refer=http%3A%2F%2Fpic.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1626575426&t=056297555e223818c83dc5d465e00ba1",
    "https://img1.baidu.com/it/u=1575169871,3281166747&fm=26&fmt=auto&gp=0.jpg"
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.getWhiteBgColor(context),
      body: Column(
        children: [
          Expanded(
              child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: ColorUtils.getThemeColor(),
                  title: Text('${S.of(context).hm_tab3_title}')
                      .textColor(Colors.white),
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
                  // backgroundColor: Colours.navi_bg,
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
                            borderRadius: const BorderRadius.only(
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
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.w, right: 12, top: 5.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("存储服务器（分布式） A-1P")
                            .fontSize(14.sp)
                            .fontWeight(FontWeight.w800)
                            .textColor(ColorUtils.get2828Color(context)),
                        Gaps.vGap8,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("600.79")
                                .fontSize(20.sp)
                                .fontWeight(FontWeight.w800)
                                .textColor(ColorUtils.getThemeColor()),
                            Gaps.hGap5,
                            Text("USDT/份")
                                .fontSize(11.sp)
                                .fontWeight(FontWeight.w800)
                                .textColor(ColorUtils.getThemeColor()),
                            Gaps.hGap8,
                            Text("≈3899 CNY")
                                .fontSize(10.sp)
                                .textColor(Colours.dark_gray_text_color),
                          ],
                        ),
                        Gaps.vGap8,
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
                        Gaps.vGap8,
                        //第二行
                        // 标题 价格
                        Text.rich(TextSpan(children: [
                          TextSpan(
                            text: '${S.of(context).hm_tab1_sy}',
                          )
                              .textColor(Colours.dark_gray_text_color)
                              .fontSize(10.sp),
                          TextSpan(
                            text: '200',
                          )
                              .textColor(ColorUtils.getThemeColor())
                              .fontSize(10.sp),
                          TextSpan(
                            text: ' ${S.of(context).dw_fen}',
                          )
                              .textColor(Colours.dark_gray_text_color)
                              .fontSize(10.sp)
                        ])),
                        Gaps.vGap5,
                        //进度条
                        MyLinearProgress(0.3, ColorUtils.getThemeColor()),
                        Gaps.vGap24,
                        HomeTimeWidget("2021-06-06", "2021-06-06", "2021-06-06",
                            "${S.of(context).hm_tab3_scfuzq}"),
                        Gaps.vGap10,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${S.of(context).hm_tab3_yjccr}: ")
                                .fontSize(10.sp)
                                .textColor(Colours.dark_gray_text_color),
                            Expanded(
                                child: Text(
                              "${S.of(context).hm_tab3_yjccr_text}",
                              maxLines: 2,
                              softWrap: true,
                            )
                                    .fontSize(10.sp)
                                    .textColor(Colours.gray_text_color)),
                          ],
                        ),
                        Gaps.vGap10,
                        Gaps.line,
                        Gaps.vGap24,
                        HomeDetailTab(_tabController, _pageController),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: Padding(
              padding: EdgeInsets.only(
                  left: 10.w, right: Dimens.gap_dp10, top: Dimens.gap_dp10),
              child: Container(
                child: PageView(
                  controller: _pageController,
                  children: <Widget>[
                    TabDetailOne(),
                    TabDetailTwo(swiperList),
                    WebPage("https://www.baidu.com/"),
                  ],
                  onPageChanged: (index) {
                    _tabController.animateTo(index);
                  },
                ),
              ),
            ),
          )),
          Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w),
            child: MyButton(
              key: const Key('login'),
              onPressed: _login,
              text: "立即购买",
            ),
          ),
          Gaps.vGap15,
        ],
      ),
    );
  }

  void _login() {
    ShowBuy.instance.show(context, 3, (data) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OrderDataPage(),
        ),
      );
    });
  }
}
