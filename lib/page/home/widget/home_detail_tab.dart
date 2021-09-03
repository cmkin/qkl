import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zjsb_app/generated/l10n.dart';
import 'package:zjsb_app/res/colors.dart';
import 'package:zjsb_app/res/styles.dart';
import 'package:zjsb_app/util/color_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeDetailTab extends StatefulWidget {
  HomeDetailTab(this.tabController, this.pageController);

  TabController tabController;
  PageController pageController;

  @override
  _HomeDetailTabState createState() => _HomeDetailTabState();
}

class _HomeDetailTabState extends State<HomeDetailTab> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      key: UniqueKey(),
      onTap: (index) {
        widget.pageController.jumpToPage(index);
      },
      isScrollable: false,
      controller: widget.tabController,
      labelStyle: TextStyles.textBold14,
      //选中背景和下划线不能同时存在
      indicatorColor: ColorUtils.getThemeColor(),
      indicatorWeight: 2,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorPadding: EdgeInsets.all(3),
      labelPadding: EdgeInsets.only(bottom: 5),
      unselectedLabelColor: Colours.dark_text,
      labelColor: ColorUtils.getThemeColor(),
      tabs: <Widget>[
        Text(
          "${S.of(context).hm_detail_tab1}",
          style: TextStyle(fontSize: 14.sp),
        ),
        Text(
          "${S.of(context).hm_detail_tab2}",
          style: TextStyle(fontSize: 14.sp),
        ),
        Text(
          "${S.of(context).hm_detail_tab3}",
          style: TextStyle(fontSize: 14.sp),
        ),
      ],
    );
  }
}
