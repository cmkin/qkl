import 'package:flutter/material.dart' hide Route;
import 'package:zjsb_app/generated/l10n.dart';
import 'package:zjsb_app/page/home/page/home_page.dart';
import 'package:zjsb_app/page/mine/page/mine_page.dart';
import 'package:zjsb_app/util/color_utils.dart';
import 'package:zjsb_app/page/device/page/device.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  List<Widget> _pageList = [Home(), Device(), MinePage()];

  final pageController = PageController();

  int currentIndex = 0;

  void onTap(int index) {
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> _barItem = [
      BottomNavigationBarItem(
          icon: Icon(Icons.home), title: Text(S.of(context).hm_title)),
      BottomNavigationBarItem(
          icon: Icon(Icons.radar), title: Text(S.of(context).dvc_title)),
      BottomNavigationBarItem(
          icon: Icon(Icons.person), title: Text(S.of(context).mi_title))
    ];

    return Scaffold(
      // this._pageList[this._currentIndex],
      body: PageView(
          controller: pageController,
          onPageChanged: onPageChanged,
          children: _pageList,
          physics: NeverScrollableScrollPhysics()),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        items: _barItem,
        iconSize: 25.sp,
        fixedColor: ColorUtils.getThemeColor(),
        selectedFontSize: 12.sp,
        unselectedFontSize: 12.sp,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
