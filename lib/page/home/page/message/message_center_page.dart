import 'package:flutter/material.dart';
import 'package:zjsb_app/generated/l10n.dart';
import 'package:zjsb_app/page/home/page/message/app_message_page.dart';
import 'package:zjsb_app/res/colors.dart';
import 'package:zjsb_app/res/dimens.dart';
import 'package:zjsb_app/res/gaps.dart';
import 'package:zjsb_app/util/color_utils.dart';
import 'package:zjsb_app/widgets/load_image.dart';
import 'package:zjsb_app/widgets/my_app_bar.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:intl/intl.dart';
import 'order_message_page.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zjsb_app/http/api.dart';
import 'package:zjsb_app/http/models/all_newest.dart';

class MessageCenter extends StatefulWidget {
  @override
  _MessageCenterState createState() => _MessageCenterState();
}

class _MessageCenterState extends State<MessageCenter> {
  //var

  int num1 = 12;
  int num2 = 12;
  List NewList = [];

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
    });
  }

  @override
  void initState() {
    super.initState();
    getNewest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.getWhiteBgColor(context),
      appBar: MyAppBar(
        isBack: true,
        centerTitle: "${S.of(context).mc_tile}",
        actionName: "${S.of(context).mc_action}",
      ),
      body: Column(
        children: [
          Material(
            //背景
            color: ColorUtils.getWhiteBgColor(context),
            child: Ink(
              child: InkWell(
                splashColor: Colours.click_color,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 12.w, right: 12.w, top: 24.w, bottom: 8),
                  child: Row(
                    children: [
                      //消息个数
                      Container(
                        width: 48.w,
                        height: 52.w,
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            Container(
                                padding: EdgeInsets.all(8.w),
                                color: ColorUtils.getThemeColor(),
                                child: LoadImage(
                                  "msgc_msg",
                                  width: 25.w,
                                  height: 25.w,
                                )),
                            num1 > 0
                                ? Positioned(
                                    right: 0,
                                    top: 0,
                                    child: Container(
                                      padding: EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle),
                                      child: Text("$num1")
                                          .textColor(Colors.white)
                                          .fontSize(12.sp),
                                    ),
                                  )
                                : Gaps.empty,
                          ],
                        ),
                      ),
                      Gaps.hGap10,
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text("${S.of(context).mc_ptgg}")
                                        .textColor(
                                            ColorUtils.get2828Color(context))
                                        .fontSize(15.sp)
                                        .fontWeight(FontWeight.w600),
                                  ),
                                  NewList.length > 0
                                      ? Text('${NewList[0]?.creatTime}')
                                          .textColor(Colours.text_gray)
                                          .fontSize(10.sp)
                                      : Gaps.empty,
                                ],
                              ),
                              Gaps.vGap5,
                              Text(
                                NewList.length > 0
                                    ? NewList[0]?.noticeTitle
                                    : "${S.of(context).mc_ptgg_empty}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              )
                                  .textColor(Colours.dark_text_gray)
                                  .fontSize(12.sp),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AppMessagePage(),
                    ),
                  );
                },
              ),
            ),
          ),
          Gaps.line,
          Material(
            //背景
            color: ColorUtils.getWhiteBgColor(context),
            child: Ink(
              child: InkWell(
                splashColor: Colours.click_color,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 12.w, right: 12.w, top: 24.w, bottom: 8),
                  child: Row(
                    children: [
                      //消息个数
                      Container(
                        width: 48.w,
                        height: 52.w,
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            Container(
                                padding: EdgeInsets.all(8.w),
                                color: Colors.green,
                                child: LoadImage(
                                  "msgc_order",
                                  width: 25.w,
                                  height: 25.w,
                                )),
                            num1 > 0
                                ? Positioned(
                                    right: 0,
                                    top: 0,
                                    child: Container(
                                      padding: EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle),
                                      child: Text("$num1")
                                          .textColor(Colors.white)
                                          .fontSize(12.sp),
                                    ),
                                  )
                                : Gaps.empty,
                          ],
                        ),
                      ),
                      Gaps.hGap10,
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text("${S.of(context).mc_ddtz}")
                                        .textColor(
                                            ColorUtils.get2828Color(context))
                                        .fontSize(15.sp)
                                        .fontWeight(FontWeight.w600),
                                  ),
                                  num1 > 0
                                      ? Text("2021-06-06 15:30:00")
                                          .textColor(Colours.text_gray)
                                          .fontSize(10.sp)
                                      : Gaps.empty,
                                ],
                              ),
                              Gaps.vGap5,
                              Text(
                                num1 > 0
                                    ? "阿桑的歌康拉德立刻改口了档案里快递给你爱的路过那里看过那可怜的给哪里看到过那块"
                                    : "${S.of(context).mc_ddtz_empty}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              )
                                  .textColor(Colours.dark_text_gray)
                                  .fontSize(12.sp),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderMessagePage(),
                    ),
                  );
                },
              ),
            ),
          ),
          Gaps.line,
        ],
      ),
    );
  }
}
