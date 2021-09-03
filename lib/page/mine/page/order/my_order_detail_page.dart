import 'package:flutter/material.dart';
import 'package:zjsb_app/generated/l10n.dart';
import 'package:zjsb_app/page/home/page/home_list_page.dart';
import 'package:zjsb_app/page/mine/page/order/my_order_tab_one_page.dart';
import 'package:zjsb_app/res/colors.dart';
import 'package:zjsb_app/res/dimens.dart';
import 'package:zjsb_app/res/gaps.dart';
import 'package:zjsb_app/res/styles.dart';
import 'package:zjsb_app/util/color_utils.dart';
import 'package:zjsb_app/widgets/my_app_bar.dart';
import 'package:styled_widget/styled_widget.dart';

import 'my_order_tab_two_page.dart';

class MyOrderDetailPage extends StatefulWidget {
  MyOrderDetailPage(this.title);

  String title;

  @override
  _MyOrderDetailPageState createState() => _MyOrderDetailPageState();
}

class _MyOrderDetailPageState extends State<MyOrderDetailPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.getWhiteBgColor(context),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              leading: IconButton(
                tooltip: '返回上一页',
                onPressed: () {
                  Navigator.maybePop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colours.appbar_back_color,
                ),
              ),
              title: Text(widget.title)
                  .fontSize(Dimens.font_sp18)
                  .textColor(ColorUtils.get2828Color(context)),
              centerTitle: true,
              //是否应该在用户滚动时变得可见 比如pinned 为false可滑出屏幕 当向下滑时可先滑出 状态栏
              floating: true,
              //当手指放开时，SliverAppBar是否会根据当前的位置展开/收起
              snap: false,
              //appBar是否置顶 是否固定在顶部 为true是固定，为false是不固定可滑出屏幕
              pinned: true,
              //展开的高度
              expandedHeight: 160,
              //折叠后的高度
              collapsedHeight: 56,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: ColorUtils.getWhiteBgColor(context),
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Container(
                        height: 100,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("11")
                                .textColor(ColorUtils.get2828Color(context))
                                .fontSize(24)
                                .fontWeight(FontWeight.w800),
                            Gaps.vGap8,
                            Text("${S.of(context).wddd_cysbs}（TiB）")
                                .textColor(Colours.text_color)
                                .fontSize(14),
                            Gaps.vGap24,
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            ///tabbar展示
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(TabBar(
                onTap: (index) {
                  _pageController.jumpToPage(index);
                },
                isScrollable: false,
                controller: _tabController,
                labelStyle: TextStyles.textBold14,
                //选中背景和下划线不能同时存在
                indicatorColor: ColorUtils.getThemeColor(),
                indicatorWeight: 2,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorPadding: EdgeInsets.only(bottom: 8),
                labelPadding: EdgeInsets.only(bottom:0),
                unselectedLabelColor: Colours.dark_text,
                labelColor: ColorUtils.getThemeColor(),
                tabs:  <Widget>[
                  Tab(text: "${S.of(context).wddd_dzf}"),
                  Tab(text: "${S.of(context).wddd_sxz}"),
                  Tab(text: "${S.of(context).wddd_ygq}"),
                ],
              )),
              pinned: true,
            )
          ];
        },
        body: Container(
          color: Colours.gray_white_color,
          child: TabBarView(controller: _tabController, children: [
            MyOrderTabOnePage("${S.of(context).wddd_dzf}"),
            MyOrderTabTwoPage("${S.of(context).wddd_sxz}"),
            MyOrderTabTwoPage("${S.of(context).wddd_ygq}"),
          ]),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _SliverAppBarDelegate(this.tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: ColorUtils.getWhiteBgColor(context),
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
