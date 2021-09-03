import 'package:flutter/material.dart';
import 'package:zjsb_app/widgets/my_app_bar.dart';
import '../../../../widgets/swiper/swiper_widget.dart';
import 'package:zjsb_app/page/home/widget/tab/CustomRRecTabIndicator.dart';
import 'package:zjsb_app/page/home/widget/tab/TabView.dart';
import 'package:zjsb_app/page/routers/fluro_navigator.dart';
import 'package:zjsb_app/res/colors.dart';
import 'package:zjsb_app/res/styles.dart';
import 'package:zjsb_app/util/toast.dart';
import 'package:zjsb_app/widgets/ios_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestPage extends StatefulWidget {
  List<String> swiperList = [
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Ft2cy.com%2Fd%2Ffile%2Fphone%2Flist%2Fpic%2F2019-11-12%2F022874178abcf489dd70f18897be09e8.jpg&refer=http%3A%2F%2Ft2cy.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1626572511&t=4720ee813f0d4439e25deaac44a79809",
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Ft2cy.com%2Fd%2Ffile%2Fphone%2Flist%2Fpic%2F2019-11-12%2Fce990c79782d49dcba427cc1a16145b6.jpg&refer=http%3A%2F%2Ft2cy.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1626572558&t=52540e6031a1e2a6002e54e895a3ca5f",
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic.jj20.com%2Fup%2Fallimg%2F1113%2F060320112631%2F200603112631-5-1200.jpg&refer=http%3A%2F%2Fpic.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1626575426&t=056297555e223818c83dc5d465e00ba1",
    "https://img1.baidu.com/it/u=1575169871,3281166747&fm=26&fmt=auto&gp=0.jpg"
  ];

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage>
    with SingleTickerProviderStateMixin {
  var _scrollController, _tabController, _inputController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(vsync: this, length: 3);
    _inputController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        centerTitle: "测试页面",
      ),
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(18.w),
                child: Container(
                  height: 50.w,
                  color: Colors.blue,
                  child: RaisedButton(
                    child: Text("弹窗"),
                    onPressed: () {
                      showDialog<void>(
                          context: context,
                          builder: (_) => IosDialog(
                                cancelBack: false,
                                title: "交易密码",
                                message: "请输入交易密码，完成支付",
                                isShowInput: true,
                                controller: _inputController,
                                onLeftPressed: () {
                                  NavigatorUtils.goBack(context);
                                },
                                onRightPressed: () {
                                  Toast.show("按了${_inputController.text}");
                                },
                              ));
                    },
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SwiperWidget(
                widget.swiperList,
                height: 130,
              ),
            ),
            // SliverToBoxAdapter(
            //   child: TabBar(
            //     tabs: <Tab>[
            //       Tab(text: "Page 1"),
            //       Tab(text: "Page 2"),
            //     ],
            //     controller: _tabController,
            //   ),
            // ),
            SliverAppBar(
              title: Text(
                "分布存储",
                style: TextStyle(color: Colors.white),
              ),
              pinned: true,
              floating: true,
              snap: false,
              primary: true,
              backgroundColor: Colors.blue,
              //展开的高度
              expandedHeight: 200,
              //折叠后的高度
              collapsedHeight: 56,
              forceElevated: innerBoxIsScrolled,
              flexibleSpace: SwiperWidget(
                widget.swiperList,
                height: 130,
              ),
              bottom: TabBar(
                onTap: (index) {},
                isScrollable: false,
                controller: _tabController,
                labelStyle: TextStyles.textBold14,
                //选中背景和下划线不能同时存在
                indicator: CustomRRecTabIndicator(
                  radius: 4,
                  color: Colors.white,
                ),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorPadding: EdgeInsets.all(3),
                labelPadding: EdgeInsets.zero,
                unselectedLabelColor: Colours.dark_text,
                labelColor: Colours.text,
                // indicatorPadding:,
                tabs: const <Widget>[
                  TabView('云设备'),
                  TabView('独享设备'),
                  TabView('联合设备'),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            _pageView(),
            _pageView(),
            _pageView(),
          ],
        ),
      ),
    );
  }

  _pageView() {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Text('List Item $index'),
            ),
          );
        },
      ),
    );
  }
}
