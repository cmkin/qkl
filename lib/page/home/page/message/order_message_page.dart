import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:zjsb_app/generated/l10n.dart';
import 'package:zjsb_app/page/order/page/order_data.dart';
import 'package:zjsb_app/res/colors.dart';
import 'package:zjsb_app/res/dimens.dart';
import 'package:zjsb_app/res/gaps.dart';
import 'package:zjsb_app/util/color_utils.dart';
import 'package:zjsb_app/widgets/data_empty.dart';
import 'package:zjsb_app/widgets/load_image.dart';
import 'package:zjsb_app/widgets/my_app_bar.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderMessagePage extends StatefulWidget {
  @override
  _MessageCenterState createState() => _MessageCenterState();
}

class _MessageCenterState extends State<OrderMessagePage> {
  List<String> _listData = [
    "a",
    "a",
    "a",
    "a",
    "a",
    "a",
    "a",
    "a",
    "a",
    "a",
  ];
  EasyRefreshController _controller;
  int _page = 1;
  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // 下拉刷新
  Future _onRefresh({bool isShow = false}) async {
    await Future.delayed(const Duration(seconds: 1), () {
      _page = 1;
      setState(() {});
    });
  }

  Future _loadMore() async {
    await Future.delayed(const Duration(seconds: 1), () {
      _page++;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.getGrayWhiteBgColor(context),
      appBar: MyAppBar(
        isBack: true,
        centerTitle: "${S.of(context).mc_ddtz}",
        actionName: "${S.of(context).mc_action}",
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 10.w),
        child: Column(
          children: [
            Expanded(child: _refresh()),
          ],
        ),
      ),
    );
  }

  Widget _refresh() {
    return EasyRefresh(
      header: BallPulseHeader(),
      footer: BallPulseFooter(),
      controller: _controller,
      child: _cellList(),
      onRefresh: _onRefresh,
      onLoad: _loadMore,
      emptyWidget: _listData.length == 0
          ? DataEmpty("${S.of(context).mc_ddtz_empty}")
          : null,
    );
  }

  Widget _cellList() {
    return ListView.separated(
      itemCount: _listData.length,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Card(
              // 边框
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: ColorUtils.getWhiteBgColor(context),
              child: Container(
                padding: EdgeInsets.only(
                    left: 8.w, right: 8.w, top: 5.w, bottom: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Text("${S.of(context).mc_dd_dzf}")
                                .fontSize(12.sp)
                                .textColor(Colours.dark_text_gray)),
                        Text("${S.of(context).time_gg}")
                            .fontSize(13.sp)
                            .textColor(Colours.dark_text_gray),
                      ],
                    ),
                    Gaps.vGap5,
                    Gaps.line,
                    Gaps.vGap10,
                    Row(
                      children: [
                        Expanded(
                            child: Text("存储服务器（分布式）A-50T")
                                .fontSize(15.sp)
                                .textColor(ColorUtils.get2828Color(context))
                                .fontWeight(FontWeight.w800)),
                        Text("x1")
                            .fontSize(12.sp)
                            .textColor(Colours.dark_text_gray),
                      ],
                    ),
                    Gaps.vGap16,
                    Text("${S.of(context).mc_dd_ddh}1111111111111111")
                        .fontSize(13.sp)
                        .textColor(Colours.dark_text_gray),
                    Gaps.vGap12,
                    Gaps.line,
                    Gaps.vGap10,
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                                    "${S.of(context).mc_dd_xdsj}2021-06-09 20：28：10")
                                .fontSize(13.sp)
                                .textColor(ColorUtils.get2828Color(context))),
                        Text("${S.of(context).mc_dd_djck}")
                            .fontSize(12.sp)
                            .textColor(Colours.dark_text_gray),
                        Gaps.hGap5,
                        LoadImage(
                          "order_go",
                          width: 12.w,
                          height: 12.w,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            //列表item的点击效果
            Positioned.fill(
              child: Material(
                //背景
                color: Colors.transparent,
                child: Ink(
                  decoration: new BoxDecoration(
                    //设置四周圆角 角度
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: InkWell(
                    splashColor: Colours.click_color.withOpacity(0.3),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderDataPage(
                            viewType: 1,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        );
      },
      separatorBuilder: (context, index) {
        return Gaps.vGap10;
      },
    );
  }
}
