import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:zjsb_app/generated/l10n.dart';
import 'package:zjsb_app/res/colors.dart';
import 'package:zjsb_app/res/dimens.dart';
import 'package:zjsb_app/res/gaps.dart';
import 'package:zjsb_app/util/color_utils.dart';
import 'package:zjsb_app/widgets/data_empty.dart';
import 'package:zjsb_app/widgets/load_image.dart';
import 'package:zjsb_app/widgets/my_app_bar.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zjsb_app/widgets/webview/web_title_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppMessagePage extends StatefulWidget {
  @override
  _MessageCenterState createState() => _MessageCenterState();
}

class _MessageCenterState extends State<AppMessagePage> {
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
      backgroundColor: ColorUtils.getWhiteBgColor(context),
      appBar: MyAppBar(
        isBack: true,
        centerTitle: "${S.of(context).mc_ptgg}",
        actionName: "${S.of(context).mc_action}",
      ),
      body: Column(
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
      emptyWidget: _listData.length == 0
          ? DataEmpty("${S.of(context).mc_ptgg_empty}")
          : null,
    );
  }

  Widget _cellList() {
    return ListView.separated(
      itemCount: _listData.length,
      itemBuilder: (context, index) {
        return Material(
          //背景
          color: ColorUtils.getWhiteBgColor(context),
          child: Ink(
            child: InkWell(
              splashColor: Colours.click_color,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("关于xx类产品介个上调的通知")
                        .fontSize(14.sp)
                        .textColor(ColorUtils.get2828Color(context))
                        .fontWeight(FontWeight.w600),
                    Gaps.vGap5,
                    Text("2021-06-06 15:30:00")
                        .textColor(Colours.text_gray)
                        .fontSize(10.sp),
                    Gaps.vGap10,
                    Text(
                      "阿桑的歌康拉德立刻改口了档案里快递给你爱的路过那里看过那可怜的给哪里看到过那块阿桑的歌康拉德立刻改口了档案里快递给你爱的路过那里看过那可怜的给哪里看到过那块",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ).textColor(Colours.dark_text_gray).fontSize(12.sp),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WebTitlePage(
                        "http://www.baidu.com", "${S.of(context).mc_ptgg}"),
                  ),
                );
              },
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Gaps.line;
      },
    );
  }
}
