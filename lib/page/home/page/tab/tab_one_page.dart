import 'package:flutter/material.dart';
import 'package:zjsb_app/generated/l10n.dart';
import 'package:zjsb_app/page/home/page/tab/detail/tab_detail_one.dart';
import 'package:zjsb_app/page/home/page/tab/detail/tab_detail_two.dart';
import 'package:zjsb_app/page/home/widget/my_linear_progress.dart';
import 'package:zjsb_app/page/home/widget/tab/label_chip.dart';
import 'package:zjsb_app/page/home/widget/tab/show_buy.dart';
import 'package:zjsb_app/page/order/page/order_data.dart';
import '../../../../widgets/webview/web_page.dart';
import 'package:zjsb_app/page/home/widget/home_detail_tab.dart';
import 'package:zjsb_app/page/home/widget/home_time_widget.dart';
import 'package:zjsb_app/res/dimens.dart';
import 'package:zjsb_app/res/gaps.dart';
import 'package:zjsb_app/util/color_utils.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zjsb_app/widgets/my_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabOnePage2 extends StatefulWidget {
  List<String> swiperList = [
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Ft2cy.com%2Fd%2Ffile%2Fphone%2Flist%2Fpic%2F2019-11-12%2F022874178abcf489dd70f18897be09e8.jpg&refer=http%3A%2F%2Ft2cy.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1626572511&t=4720ee813f0d4439e25deaac44a79809",
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Ft2cy.com%2Fd%2Ffile%2Fphone%2Flist%2Fpic%2F2019-11-12%2Fce990c79782d49dcba427cc1a16145b6.jpg&refer=http%3A%2F%2Ft2cy.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1626572558&t=52540e6031a1e2a6002e54e895a3ca5f",
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic.jj20.com%2Fup%2Fallimg%2F1113%2F060320112631%2F200603112631-5-1200.jpg&refer=http%3A%2F%2Fpic.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1626575426&t=056297555e223818c83dc5d465e00ba1",
    "https://img1.baidu.com/it/u=1575169871,3281166747&fm=26&fmt=auto&gp=0.jpg"
  ];
  @override
  _TabOnePageState createState() => _TabOnePageState();
}

class _TabOnePageState extends State<TabOnePage2>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final PageController _pageController = PageController(initialPage: 0);
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
                    title: Text("存储服务器（分布式）A-1T").fontSize(16.sp),
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
                    backgroundColor: ColorUtils.getThemeColor(),
                    //是否应该在用户滚动时变得可见 比如pinned 为false可滑出屏幕 当向下滑时可先滑出 状态栏
                    floating: true,
                    //当手指放开时，SliverAppBar是否会根据当前的位置展开/收起
                    snap: false,
                    //appBar是否置顶 是否固定在顶部 为true是固定，为false是不固定可滑出屏幕
                    pinned: true,
                    //展开的高度
                    expandedHeight: 180.w,
                    //折叠后的高度
                    collapsedHeight: 60.w,
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      background: Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          Container(
                            height: 256.w,
                            decoration: BoxDecoration(
                                // 线性渐变
                                gradient: LinearGradient(
                              colors: [
                                Colors.white.withOpacity(0.3),
                                ColorUtils.getThemeColor().withOpacity(1)
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            )),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: 12.w,
                              right: 12.w,
                              top: 10.w,
                            ),
                            height: 150.w,
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Gaps.vGap10,
                                LabelChip(
                                  labList: ['满存版', '540+540', '掌握文档发我'],
                                  labBgColor: Colors.white,
                                  labTextColor: ColorUtils.getThemeColor(),
                                ),
                                Gaps.vGap10,
                                Text("${S.of(context).hm_tab1_fwzq}")
                                    .fontSize(12.sp)
                                    .textColor(Colors.white),
                                Text("540${S.of(context).dw_tian}+540${S.of(context).dw_tian}")
                                    .fontSize(20.sp)
                                    .textColor(Colors.white),
                                Gaps.vGap16,
                                //进度条
                                MyLinearProgress(0.3, Colors.white),
                                Gaps.vGap5,
                                Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                                "${S.of(context).hm_tab1_sy}200${S.of(context).dw_fen}")
                                            .fontSize(12.sp)
                                            .textColor(Colors.white)),
                                    Text("${S.of(context).hm_tab1_dj}1688CNY/${S.of(context).dw_fen}")
                                        .fontSize(12.sp)
                                        .textColor(Colors.white),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 12.w, right: 12.w, top: 12.w),
                      child: Container(
                        child: Column(
                          children: [
                            HomeTimeWidget("2021-06-06", "2021-06-06",
                                "2021-06-06", "${S.of(context).hm_tab1_zczq}"),
                            Gaps.vGap24,
                            Gaps.line,
                            Gaps.vGap24,
                            HomeDetailTab(_tabController, _pageController),
                          ],
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.w),
                child: Container(
                  child: PageView(
                    controller: _pageController,
                    children: <Widget>[
                      TabDetailOne(),
                      TabDetailTwo(widget.swiperList),
                      WebPage("https://www.baidu.com/"),
                    ],
                    onPageChanged: (index) {
                      _tabController.animateTo(index);
                    },
                  ),
                ),
              ),
            ),
          ),
          //底部按钮
          Container(
            margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.w),
            child: MyButton(
              key: const Key('tabone'),
              onPressed: () {
                ShowBuy.instance.show(context, 1, (data) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderDataPage(
                        viewType: 1,
                      ),
                    ),
                  );
                });
              },
              text: "立即购买",
            ),
          ),
        ],
      ),
    );
  }
}
