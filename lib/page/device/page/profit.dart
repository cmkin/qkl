import 'package:flutter/material.dart';
import 'package:zjsb_app/generated/l10n.dart';
import 'package:zjsb_app/page/home/page/home_list_page.dart';
import 'package:zjsb_app/page/home/widget/tab/CustomRRecTabIndicator.dart';
import 'package:zjsb_app/page/home/widget/tab/TabView.dart';
import 'package:zjsb_app/page/mine/page/services/mine_services.dart';
import 'package:zjsb_app/res/colors.dart';
import 'package:zjsb_app/res/styles.dart';
import 'package:zjsb_app/util/color_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class profit extends StatefulWidget {
  const profit() : super();

  @override
  _profitState createState() => _profitState();
}

class _profitState extends State<profit> with SingleTickerProviderStateMixin {
  //总数收益
  bool showMoney = true;

  Widget allUsdt() {
    return Container(
      margin: EdgeInsets.all(10.w),
      padding: EdgeInsets.only(top: 20.w, bottom: 10.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(
              // Where the linear gradient begins and ends
              end: Alignment.topRight,
              begin: Alignment.bottomLeft,
              // Add one stop for each color. Stops should increase from 0 to 1
              //stops: [0.3, 0.5, 0.7, 0.9],
              colors: [
                Colours.dark_button_disabled,
                ColorUtils.getThemeColor()
              ])),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                showMoney ? '1688.00 USDT' : '**** USDT',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10.sp,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    showMoney = !showMoney;
                  });
                },
                child: Icon(
                  showMoney
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: Colors.white,
                  size: 14.sp,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 8.w, bottom: 8.w),
            child: Text(
              S.of(context).dvc_ccsy,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10.w),
            child: Text(
              '${S.of(context).dvc_zrsy}:(+26)',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10.sp,
              ),
            ),
          ),
          SizedBox(
            height: 25.w,
            width: 80.w,
            child: RaisedButton(
                padding: EdgeInsets.all(1.w),
                color: ColorUtils.getThemeColor(),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RechargePage(
                        viewType: 2,
                      ),
                    ),
                  );
                },
                child: Text(
                  S.of(context).mi_tx,
                  style: TextStyle(color: Colors.white, fontSize: 12.sp),
                ),
                shape: StadiumBorder()),
          ),
        ],
      ),
    );
  }

  //tabBar
  TabController _tabController;

  Widget _tabbar() {
    return Container(
      height: 36.sp,
      margin: EdgeInsets.fromLTRB(10.w, 0, 10.w, 10.w),
      decoration: BoxDecoration(
        color: ColorUtils.getGrayWhiteBgColor(context),
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
      ),
      child: TabBar(
        key: UniqueKey(),
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
        isScrollable: false,
        controller: _tabController,
        labelStyle: TextStyles.textBold14,
        //选中背景和下划线不能同时存在
        indicator: CustomRRecTabIndicator(
          radius: 4,
          color: ColorUtils.getThemeColor(),

          //color: Colors.white,
        ),
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: EdgeInsets.all(3.w),
        labelPadding: EdgeInsets.zero,
        unselectedLabelColor: Colours.dark_text,
        labelColor: Colors.white,
        // indicatorPadding:,
        tabs: [
          TabView(S.of(context).hm_tab1),
          TabView(S.of(context).hm_tab2),
          TabView(S.of(context).hm_tab3),
        ],
      ),
    );
  }

  //tablist

  PageController _pageController = PageController(initialPage: 0);

  Widget tabList() {
    //列表
    var listPage = (type) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.white),
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding:
                        EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.w),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1,
                                color:
                                    ColorUtils.getGrayWhiteBgColor(context)))),
                    child: Text('BZZ $index',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold)),
                  ),
                  ListView.builder(
                    shrinkWrap: true, //为true可以解决子控件必须设置高度的问题
                    physics: NeverScrollableScrollPhysics(), //禁用滑动事件
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.w, horizontal: 10.w),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1,
                                    color: ColorUtils.getGrayWhiteBgColor(
                                        context)))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '型号1',
                              style: TextStyle(fontSize: 14.sp),
                            ),
                            Text(
                              '0.00USDT',
                              style: TextStyle(fontSize: 14.sp),
                            ),
                            Text(
                              '1天',
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      );
    };

    return Container(
        margin: EdgeInsets.fromLTRB(10.w, 0, 10.w, 10.w),
        child: PageView.builder(
            physics: BouncingScrollPhysics(),
            controller: _pageController,
            onPageChanged: (int index) {
              _tabController.animateTo(index,
                  duration: Duration(milliseconds: 300));
            },
            itemCount: 3,
            itemBuilder: (context, index) {
              return listPage(index);
            }));
  }

  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this, length: 3);
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.getGrayWhiteBgColor(context),
      appBar: AppBar(
          title: Text(
            S.of(context).dvc_ccsy,
            style: TextStyle(color: Colors.black, fontSize: 18.sp),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colours.text_color,
              size: 18.sp,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: ColorUtils.getWhiteBgColor(context),
          elevation: 1),
      body: Container(
        child: Container(
          child: Column(
            children: [
              allUsdt(),
              _tabbar(),
              Expanded(
                child: tabList(),
              )
            ],
          ),
        ),

        //Column(children: [allUsdt(), tabList()]),
      ),
    );
  }
}
