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
import 'package:zjsb_app/widgets/my_button.dart';

class MyOrderTabTwoPage extends StatefulWidget {
  MyOrderTabTwoPage(this.title);

  String title;

  @override
  _MessageCenterState createState() => _MessageCenterState();
}

class _MessageCenterState extends State<MyOrderTabTwoPage>
    with AutomaticKeepAliveClientMixin {
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
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 5),
      child: Column(
        children: [
          Expanded(child: _refresh()),
        ],
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
      emptyWidget: _listData.length == 0 ? DataEmpty("${S.of(context).wddd_empty}") : null,
    );
  }

  Widget _cellList() {
    return ListView.separated(
      itemCount: _listData.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){
            print("点击Item$index");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderDataPage(viewType: 2,),
              ),
            );
          },
          child: Card(
            // 边框
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: ColorUtils.getWhiteBgColor(context),
            child: Container(
              padding: EdgeInsets.only(left: 12, right: 12, top: 5, bottom: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text("${S.of(context).wddd_ddh}1111111111111111")
                              .fontSize(12)
                              .textColor(Colours.dark_text_gray)),
                      Text(widget.title)
                          .fontSize(13)
                          .textColor(widget.title.contains("过期")||widget.title.contains("Expired")?Colours.dark_text:ColorUtils.getThemeColor()),
                    ],
                  ),
                  Gaps.vGap5,
                  Gaps.line,
                  Gaps.vGap10,
                  Row(
                    children: [
                      Expanded(
                          child: Text("存储服务器（分布式）A-50T")
                              .fontSize(15)
                              .textColor(ColorUtils.get2828Color(context))
                              .fontWeight(FontWeight.w800)),
                      Text("x1").fontSize(12).textColor(Colours.dark_text_gray),
                    ],
                  ),
                  Gaps.vGap24,
                  Text("${S.of(context).wddd_xdsj}2021-06-09 20：28：10")
                      .fontSize(13)
                      .textColor(Colours.dark_text_gray),
                  Gaps.vGap12,
                  Gaps.line,
                  Gaps.vGap5,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text("${S.of(context).wddd_ljccsy}200.00 BZZ").fontSize(13).textColor(Colours.home_bg_orange_),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Gaps.vGap10;
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}


