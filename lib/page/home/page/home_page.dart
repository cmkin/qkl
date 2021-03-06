import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zjsb_app/common/provider/theme_provider.dart';
import 'package:zjsb_app/generated/l10n.dart';
import 'package:zjsb_app/http/models/home_list.dart';
import 'package:zjsb_app/http/models/user_info.dart' as UserInfoModels;
import 'package:zjsb_app/mvp/base_page.dart';
import 'package:zjsb_app/page/home/iview/home_iview.dart';
import 'package:zjsb_app/page/home/models/app_update_entity.dart';
import 'package:zjsb_app/page/home/models/test_entity.dart';
import 'package:zjsb_app/page/home/page/message/app_message_detail.dart';
import 'package:zjsb_app/page/home/page/message/message_center_page.dart';
import 'package:zjsb_app/page/home/presenter/home_presenter.dart';
import 'package:zjsb_app/page/home/provider/home_provider.dart';
import 'package:zjsb_app/page/login/page/login_page.dart';
import 'package:zjsb_app/page/login/provider/user_info.dart';
import 'package:zjsb_app/widgets/marguee/index.dart';
import 'home_list_page.dart';
import 'package:zjsb_app/util/image_utils.dart';
import '../widget/tab/CustomRRecTabIndicator.dart';
import '../widget/tab/TabView.dart';
import 'package:zjsb_app/page/home/widget/pinfo_image.dart';
import '../../../widgets/swiper/swiper_widget.dart';
import 'package:zjsb_app/res/colors.dart';
import 'package:zjsb_app/res/dimens.dart';
import 'package:zjsb_app/res/gaps.dart';
import 'package:zjsb_app/res/styles.dart';
import 'package:zjsb_app/util/color_utils.dart';
import 'package:zjsb_app/util/native_utils.dart';
import 'package:zjsb_app/widgets/load_image.dart';
import 'package:zjsb_app/widgets/update_dialog.dart';

import 'package:zjsb_app/mvp/base_page_presenter.dart';
import 'package:zjsb_app/mvp/net/dio_utils.dart';
import 'package:zjsb_app/mvp/net/http_api.dart';

import 'package:pk_skeleton/pk_skeleton.dart';

import 'package:zjsb_app/http/api.dart';
import 'package:intl/intl.dart';
import 'package:zjsb_app/util/console.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  List<String> swiperList = [
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Ft2cy.com%2Fd%2Ffile%2Fphone%2Flist%2Fpic%2F2019-11-12%2F022874178abcf489dd70f18897be09e8.jpg&refer=http%3A%2F%2Ft2cy.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1626572511&t=4720ee813f0d4439e25deaac44a79809",
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Ft2cy.com%2Fd%2Ffile%2Fphone%2Flist%2Fpic%2F2019-11-12%2Fce990c79782d49dcba427cc1a16145b6.jpg&refer=http%3A%2F%2Ft2cy.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1626572558&t=52540e6031a1e2a6002e54e895a3ca5f",
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic.jj20.com%2Fup%2Fallimg%2F1113%2F060320112631%2F200603112631-5-1200.jpg&refer=http%3A%2F%2Fpic.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1626575426&t=056297555e223818c83dc5d465e00ba1",
    "https://img1.baidu.com/it/u=1575169871,3281166747&fm=26&fmt=auto&gp=0.jpg"
  ];

  List<String> textList = ["????????????"];

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>
    with
        BasePageMixin<Home, HomePresenter>,
        SingleTickerProviderStateMixin,
        AutomaticKeepAliveClientMixin
    implements HomeIMvpView {
  //var
  TabController _tabController;
  final PageController _pageController = PageController(initialPage: 0);
  var newObj;
  List<String> newList = [];
  //HomeProvider provider = HomeProvider();
  // UserInfoPrivider provider = UserInfoPrivider();

  //methods

  void getHomeNewest() async {
    var newData = await homePage.getHomeNewest();
    String creatTime = DateFormat('yyyy-MM-dd HH:mm:ss')
        .format(DateTime.fromMillisecondsSinceEpoch(newData.time));
    newData.creatTime = creatTime;
    //newData.creatTime = creatTime;
    setState(() {
      newObj = newData;
      newList = [newData.noticeTitle];
    });
  }

  @override
  // ignore: todo
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);

    getHomeNewest();

    ///????????????????????????
    nativeMessageListener();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String tab1 = S.of(context).hm_tab1;
    String tab2 = S.of(context).hm_tab2;
    String tab3 = S.of(context).hm_tab3;

    var userInfo = context.select<UserInfoPrivider, UserInfoModels.Data>(
      (UserInfo) => UserInfo.userInfo,
    );

    return Scaffold(
      body: Container(
        color: ColorUtils.getWhiteBgColor(context),
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              //????????????
              SliverAppBar(
                floating: true,
                pinned: true,
                title: Row(
                  children: [
                    ClipOval(
                        child: PInfoImage(
                      url: userInfo != null
                          ? userInfo?.headUrl
                          : "icon_uesr_default",
                      size: ScreenUtil().setSp(28),
                    )),
                    Gaps.hGap5,

                    userInfo == null
                        ? InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            },
                            child: Text(S.of(context).l_wdl)
                                .fontSize(14.sp)
                                .textColor(ColorUtils.getThemeColor()))
                        : Text("${userInfo?.nick}")
                            .fontSize(ScreenUtil().setSp(14))
                            .textColor(ColorUtils.getThemeColor()),
                    // Consumer<UserInfoPrivider>(
                    //   builder: (context, userinfo, child) {
                    //     return Text(userinfo.userInfo != null
                    //             ? "${userinfo?.nick}"
                    //             : "?????????")
                    //         .fontSize(ScreenUtil().setSp(14))
                    //         .textColor(ColorUtils.getThemeColor());
                    //   },
                    // ),
                  ],
                ),
                actions: <Widget>[
                  new IconButton(
                    icon: ImageIcon(ImageUtils.getAssetImage("home_message"),
                        size: ScreenUtil().setSp(20), color: Colors.black),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MessageCenter(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              //??????????????????
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: Column(
                    children: [
                      SwiperWidget(
                        widget.swiperList,
                        radius: 0,
                        height: ScreenUtil().setHeight(130),
                      ),
                      Row(
                        children: [
                          LoadImage(
                            "home_hint",
                            width: ScreenUtil().setWidth(26),
                            height: ScreenUtil().setHeight(26),
                          ),
                          Container(
                            alignment: Alignment(-1, 0),
                            height: ScreenUtil().setHeight(34),
                            child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          AppMessageDetail(item: newObj),
                                      //WebTitlePage("http://www.baidu.com", "${S.of(context).mc_ptgg}")
                                    ),
                                  );
                                },
                                child: Text(
                                  newObj != null
                                      ? newObj?.noticeTitle
                                      : S.of(context).home_zwxx,
                                  style: TextStyle(fontSize: 13.sp),
                                )),
                          ),
                          // Container(
                          //   height: ScreenUtil().setHeight(34),
                          //   child: FlutterMarquee(
                          //       texts: newList.length == 0
                          //           ? widget.textList
                          //           : newList,
                          //       textSize: ScreenUtil().setSp(12),
                          //       autoStart: false,
                          //       //textColor: Colors.red,
                          //       //seletedTextColor:ColorUtils.getThemeColor(),
                          //       onChange: (i) {
                          //         print("???????????????$i");
                          //       },
                          //       duration: 5),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //????????????
              SliverToBoxAdapter(
                child: Container(
                  height: ScreenUtil().setHeight(12),
                  color: ColorUtils.getGrayWhiteBgColor(context),
                ),
              ),
              //????????????
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gaps.vGap8,
                      Text(S.of(context).hm_title1)
                          .fontSize(ScreenUtil().setSp(16))
                          .bold()
                          .textColor(ColorUtils.get2828Color(context)),
                    ],
                  ),
                ),
              ),
              //????????????
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: Center(
                    child: Container(
                      height: ScreenUtil().setHeight(32),
                      decoration: BoxDecoration(
                        color: ColorUtils.getGrayWhiteBgColor(context),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4.0)),
                      ),
                      child: TabBar(
                        key: UniqueKey(),
                        onTap: (index) {
                          _pageController.jumpToPage(index);
                        },
                        isScrollable: false,
                        controller: _tabController,
                        labelStyle: TextStyles.textBold14,
                        //??????????????????????????????????????????
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
                        tabs: <Widget>[
                          TabView(tab1),
                          TabView(tab2),
                          TabView(tab3),
                        ],
                      ),
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
                  HomeListPage(1),
                  HomeListPage(2),
                  HomeListPage(3),
                ],
                onPageChanged: (index) {
                  _tabController.animateTo(index);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  HomePresenter createPresenter() => HomePresenter();

  Future<dynamic> nativeMessageListener() async {
    // ignore: missing_return
    NativeUtils.getChannel().setMethodCallHandler((resultCall) {
      MethodCall call = resultCall;
      String method = call.method;
      if (method == "scanSuccess") {
        Map arguments = call.arguments;
        bool isFinish = arguments["isFinish"];
      }
    });
  }

  @override
  Future<void> setUpdate(AppUpdateEntity entity) async {
    closeProgress();
    if (entity.code == "200" || entity.data.update) {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      String version = packageInfo.version;
      if (entity.data.version == version) {
        showToast("????????????????????????");
        return;
      }
      showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (_) => UpdateDialog(entity.data));
    } else {
      showToast("????????????????????????");
    }
  }

  @override
  void setResponse(TestEntity entity) {
    //provider.setData(entity);
  }
}
