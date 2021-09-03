import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:zjsb_app/res/dimens.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabView extends StatelessWidget {
  const TabView(this.tabName, {this.index = 0});

  final String tabName;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              tabName,
              style: TextStyle(fontSize: 14.sp),
            ),
            Visibility(
              visible: index > 0 ? true : false,
              child: Padding(
                padding: EdgeInsets.only(top: 1.0),
                child: Text(
                  ' ($index件)',
                  style: TextStyle(fontSize: Dimens.font_sp12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
