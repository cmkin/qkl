import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:zjsb_app/page/login/page/login_page.dart';
import 'package:zjsb_app/util/color_utils.dart';
import 'package:zjsb_app/res/colors.dart';
import 'package:zjsb_app/generated/l10n.dart';
import 'dart:math' as math;
import 'package:zjsb_app/page/device/page/profit.dart';
import 'package:zjsb_app/page/routers/fluro_navigator.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zjsb_app/http/api.dart' as DeviceApi;
import 'package:zjsb_app/widgets/data_empty.dart';
import 'package:zjsb_app/widgets/page_loading.dart';

class Device extends StatefulWidget {
  //const Device({ Key? key }) : super(key: key);

  @override
  _DeviceState createState() => _DeviceState();
}

class _DeviceState extends State<Device> with AutomaticKeepAliveClientMixin {
  //var
  var deviceList;
  bool _loading = true;
  bool hasLogin = true;
  //methods

  void getDeviceListM() async {
    var data = await DeviceApi.Device.getDeviceList();
    if (data == false) {
      //未登录
      setState(() {
        hasLogin = false;
      });
    } else {
      setState(() {
        deviceList = data;
        _loading = false;
        hasLogin = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getDeviceListM();
  }

  //动态列表数据：
  List<Widget> _getdata() {
    Widget itemDom(item) {
      return Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 10.h),
          child: Stack(children: [
            InkWell(
              onTap: () {
                print('object');
              },
              child: Container(
                //color:Colors.white,
                padding: EdgeInsets.fromLTRB(20.w, 20.h, 60.w, 20.h),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${item.deviceType.deviceName} ${S.of(context).dvc_sys} ",
                          style: TextStyle(fontSize: 16.sp),
                        ),
                        Text("0.00USDT",
                            style: TextStyle(
                                color: ColorUtils.getThemeColor(),
                                fontSize: 16.sp)),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 20.h, 0, 10.h),
                          child: Text(
                            '${S.of(context).dvc_sls}：20',
                            style: TextStyle(fontSize: 12.sp),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(10.w, 3.h, 10.w, 3.h),
                          margin: EdgeInsets.fromLTRB(0, 0, 10.w, 5.h),
                          child: Text(
                            '满存版',
                            style: TextStyle(
                                color: ColorUtils.getThemeColor(),
                                fontSize: 12.sp),
                          ),
                          decoration: BoxDecoration(
                              color: ColorUtils.getLightBlueColor(context),
                              borderRadius: BorderRadius.circular(2)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return profit();
                  }));
                },
                child: Image.asset(
                  'assets/images/dm.png',
                  //height: 160.h,
                ),
              ),

              // child: Container(
              //     width: 200,

              //      color: Colors.red,
              //       child: Transform.rotate(
              //           angle:-math.pi / 4 ,
              //           child:Transform.translate(
              //             offset: Offset(30.0, -20.0),
              //             child:Container(
              //                   width: 25,
              //                   height: 100,
              //                   color: ColorUtils.getThemeColor(),
              //                   child: null,
              //                 ) ,
              //           ),
              //         )  ,
              // ),
            )
          ]));
    }

    List<Widget> list = new List();
    for (var i = 0; i < deviceList.length; i++) {
      list.add(itemDom(deviceList[i]));
    }
    return list.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.getGrayWhiteBgColor(context),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            child: Container(
              height: 140.h,
              alignment: Alignment.center,
              // width:double.infinity,
              //constraints: BoxConstraints.tightFor(width: double.infinity, height: 150.0), //卡片大小
              decoration: BoxDecoration(
                  //背景装饰
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
              // Color: ColorUtils.getThemeColor(),
              child: Text("${S.of(context).dvc_gl}",
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.5),
                      fontSize: 16.sp)),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 20.h,
            bottom: 0,
            child: Container(
                padding: EdgeInsets.fromLTRB(0, 80.h, 0, 0),
                margin: EdgeInsets.fromLTRB(10.w, 0, 10.w, 0),
                child: !hasLogin
                    ? Container(
                        alignment: Alignment(0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              child: FlatButton(
                                // minWidth: 100.w,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  S.of(context).l_qdl,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14.sp),
                                ),
                                color: ColorUtils.getThemeColor(),
                              ),
                            )
                          ],
                        ),
                      )
                    : _loading
                        ? Container(
                            color: Colors.white,
                            child: PageLoading(
                              num: 4,
                            ),
                          )
                        : deviceList.length == 0
                            ? DataEmpty(S.of(context).no_date)
                            : ListView(
                                children: this._getdata(),
                              )),
          ),
        ],
      ),

      // body: NestedScrollView(
      //     headerSliverBuilder: _sliverBuilder,
      //     body: Container(
      //       padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      //       child: Stack(children: [
      //         Positioned(
      //           top: -40.0,
      //           child: Container(
      //               child: ListView(
      //             children: this._getdata(),
      //           )),
      //         )
      //       ]),
      //     )),
    );
  }

  @override
  // ignore: todo
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

List<Widget> _sliverBuilder(BuildContext context, bool innerBoxIsScrolled) {
  return <Widget>[
    SliverAppBar(
        //title: Text("${S.of(context).dvc_gl}"),
        //标题居中
        centerTitle: true,
        //展开高度200
        expandedHeight: 140.h,
        //不随着滑动隐藏标题
        //floating: false,
        //固定在顶部
        // pinned: true,
        titleTextStyle: TextStyle(fontSize: 12.sp),
        backgroundColor: ColorUtils.getThemeColor(),
        flexibleSpace: FlexibleSpaceBar(
          // centerTitle: true,
          // title: Text('我是一个FlexibleSpaceBar'),
          background: Container(
            // height: 120,
            alignment: Alignment.center,
            // width:double.infinity,
            //constraints: BoxConstraints.tightFor(width: double.infinity, height: 150.0), //卡片大小
            decoration: BoxDecoration(
                //背景装饰
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
            // Color: ColorUtils.getThemeColor(),
            child: Text("${S.of(context).dvc_gl}",
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 0.5),
                    fontSize: 16.sp)),
          ),
        ))
  ];
}
