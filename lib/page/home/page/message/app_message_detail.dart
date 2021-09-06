import 'package:flutter/material.dart';
import 'package:zjsb_app/generated/l10n.dart';
import 'package:zjsb_app/widgets/my_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class AppMessageDetail extends StatefulWidget {
  final item;
  const AppMessageDetail({this.item});

  @override
  _AppMessageDetailState createState() => _AppMessageDetailState();
}

class _AppMessageDetailState extends State<AppMessageDetail>
    with AutomaticKeepAliveClientMixin {
  //var
  String datec;

  @override
  void initState() {
    super.initState();
    datec = DateFormat('yyyy${S().date_year}MM${S().date_mon}dd${S().date_day}')
        .format(DateTime.fromMillisecondsSinceEpoch(widget.item.time));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        isBack: true,
        centerTitle: "${S.of(context).message_ggxq}",
        backgroundColor: Color.fromRGBO(249, 249, 249, 0.94),
      ),
      body: Container(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 5.w),
              alignment: Alignment(0, 0),
              child: Text(
                widget.item.noticeTitle,
                style: TextStyle(fontSize: 16.sp),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10.w),
              alignment: Alignment(0, 0),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 1, color: Color.fromRGBO(243, 243, 243, 1)))),
              child: Text(
                widget.item.creatTime,
                style: TextStyle(
                    fontSize: 12.sp, color: Color.fromRGBO(153, 153, 153, 1)),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10.w, top: 10.w),
              alignment: Alignment(-1, 0),
              child: Text(
                widget.item.content,
                style: TextStyle(
                    fontSize: 14.sp, color: Color.fromRGBO(102, 102, 102, 1)),
              ),
            ),
            Container(
              alignment: Alignment(1, 0),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment(1, 0),
                    child: Text('BITX云储',
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: Color.fromRGBO(102, 102, 102, 1))),
                  ),
                  Container(
                    alignment: Alignment(1, 0),
                    child: Text(datec,
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: Color.fromRGBO(102, 102, 102, 1))),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
