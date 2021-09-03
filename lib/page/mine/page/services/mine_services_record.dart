import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zjsb_app/generated/l10n.dart';
import 'package:zjsb_app/res/colors.dart';
import 'package:zjsb_app/res/styles.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zjsb_app/util/color_utils.dart';

import 'mine_sevices_list.dart';

class RechargeRecordPage extends StatefulWidget {
  final int viewType;
  RechargeRecordPage({Key key, this.viewType = 1}) : super(key: key);
  @override
  _RechargeRecordPageState createState() => _RechargeRecordPageState();
}

class _RechargeRecordPageState extends State<RechargeRecordPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  int _selectIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 监听 TabController 滚动事件
    _tabController = TabController(vsync: this, length: 4)
      ..addListener(() {
        setState(() {
          _selectIndex = _tabController.index;
        });
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorUtils.getWhiteBgColor(context),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colours.text_color,
            size: 18,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 1,
        title: Text(
          widget.viewType == 1
              ? S.of(context).mine_service_czjl
              : S.of(context).mine_service_txjl,
          style: TextStyles.get2828TextStyle(context),
        ).fontSize(16), //,.fontWeight(FontWeight.bold),
        centerTitle: true,
        bottom: TabBar(
          onTap: (index) {
            _selectIndex = index;
          },
          isScrollable: false,
          labelStyle: TextStyles.textBold14,
          controller: _tabController,
          //选中背景和下划线不能同时存在
          indicatorColor: ColorUtils.getThemeColor(),
          indicatorWeight: 2,
          indicatorSize: TabBarIndicatorSize.label,
          labelPadding: EdgeInsets.only(bottom: 0),
          unselectedLabelColor: Colours.dark_text,
          labelColor: ColorUtils.get2828Color(context),
          tabs: [
            Tab(text: S.of(context).mine_record_qb),
            Tab(text: S.of(context).mine_record_clz),
            Tab(text: S.of(context).mine_record_ywc),
            Tab(text: S.of(context).mine_record_yqx),
          ],
        ),
      ),
      body: Container(
        color: ColorUtils.getGrayWhiteBgColor(context),
        child: TabBarView(
          controller: _tabController,
          children: [
            SevicesListPage(
              viewType: widget.viewType,
              selectIndex: _selectIndex,
            ),
            SevicesListPage(
              viewType: widget.viewType,
              selectIndex: _selectIndex,
            ),
            SevicesListPage(
              viewType: widget.viewType,
              selectIndex: _selectIndex,
            ),
            SevicesListPage(
              viewType: widget.viewType,
              selectIndex: _selectIndex,
            ),
          ],
        ),
      ),
    );
  }
}
