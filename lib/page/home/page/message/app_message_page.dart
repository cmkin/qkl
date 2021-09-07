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
import 'package:zjsb_app/widgets/page_loading.dart';
import 'package:zjsb_app/widgets/webview/web_title_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zjsb_app/http/api.dart';
import 'package:zjsb_app/http/models/all_newest.dart';
import 'package:intl/intl.dart';
import 'package:zjsb_app/page/home/page/message/app_message_detail.dart';

class AppMessagePage extends StatefulWidget {
  @override
  _MessageCenterState createState() => _MessageCenterState();
}

class _MessageCenterState extends State<AppMessagePage>
    with AutomaticKeepAliveClientMixin {
  //var
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

  List NewList = [];
  bool _loading = true;

  //methods

  void getNewest() async {
    var data = await MessagePage.getAllNewest();
    setState(() {
      NewList = data.map((item) {
        String creatTime = DateFormat('yyyy-MM-dd HH:mm:ss')
            .format(DateTime.fromMillisecondsSinceEpoch(item.time));
        item.creatTime = creatTime;

        return item;
      }).toList();
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getNewest();
    _controller = EasyRefreshController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // 下拉刷新
  Future _onRefresh({bool isShow = false}) async {
    await getNewest();
  }

  Future _loadMore() async {
    await Future.delayed(const Duration(seconds: 1), () {
      _page++;
      setState(() {});
    });
  }

  //页面
  Widget _pageUi() {
    return Scaffold(
      backgroundColor: ColorUtils.getWhiteBgColor(context),
      appBar: MyAppBar(
        isBack: true,
        centerTitle: "${S.of(context).mc_ptgg}",
        actionName: "${S.of(context).mc_action}",
      ),
      body: Column(
        children: [
          Expanded(
              child: _loading
                  ? PageLoading(
                      num: 3,
                    )
                  : _refresh()),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _pageUi();
  }

  Widget _refresh() {
    return EasyRefresh(
      header: BallPulseHeader(),
      footer: BallPulseFooter(),
      controller: _controller,
      child: _cellList(),
      onRefresh: _onRefresh,
      onLoad: _loadMore,
      emptyWidget: NewList.length == 0
          ? DataEmpty("${S.of(context).mc_ptgg_empty}")
          : null,
    );
  }

  Widget _cellList() {
    return ListView.separated(
      itemCount: NewList.length,
      itemBuilder: (context, index) {
        var item = NewList[index];
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
                    Text(item.noticeTitle)
                        .fontSize(14.sp)
                        .textColor(ColorUtils.get2828Color(context))
                        .fontWeight(FontWeight.w600),
                    Gaps.vGap5,
                    Text(item.creatTime)
                        .textColor(Colours.text_gray)
                        .fontSize(10.sp),
                    Gaps.vGap10,
                    Text(
                      item.content,
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
                    builder: (context) => AppMessageDetail(item: item),
                    //WebTitlePage("http://www.baidu.com", "${S.of(context).mc_ptgg}")
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
