import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:zjsb_app/res/dimens.dart';
import 'package:zjsb_app/util/color_utils.dart';
import 'package:zjsb_app/widgets/load_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabDetailTwo extends StatefulWidget {
  TabDetailTwo(this.swiperList);
  List<String> swiperList;
  @override
  _TabDetailTwoState createState() => _TabDetailTwoState();
}

class _TabDetailTwoState extends State<TabDetailTwo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: Container(
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) => Container(
              height: 10.w,
              color: ColorUtils.getWhiteBgColor(context),
            ),
            itemCount: widget.swiperList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.only(left: 12.w, right: 12.w),
                child: LoadImage(
                  widget.swiperList[index],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
