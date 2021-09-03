import 'package:flutter/material.dart';
import 'package:zjsb_app/res/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///表格组件
class HiTable extends StatefulWidget {
  final List<List<TableDetail>> tableList;

  const HiTable(this.tableList);

  @override
  _HiTableState createState() => _HiTableState();
}

class _HiTableState extends State<HiTable> {
  List<List<TableDetail>> tableList = [];

  @override
  void initState() {
    super.initState();
    this.tableList = widget.tableList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            _horizontalDivider(), //第一个根横线
            Column(
                children: tableList.map((child) {
              return Column(
                children: [
                  Row(children: _children(child)),
                  _horizontalDivider()
                ],
              );
            }).toList())
          ],
        ));
  }

  _children(List<TableDetail> list) {
    List<Widget> children = [];
    List<Widget> children1 = list.map((tableDetail) {
      return Expanded(
          flex: 1,
          child: Container(
            child: Row(
              children: [
                _containerTitle(tableDetail.title),
                _verticalDivider(),
                _containerContent(tableDetail.content),
                _verticalDivider(),
              ],
            ),
          ));
    }).toList();
    children.add(_verticalDivider()); //添加一行当中第一个竖线
    children.addAll(children1);
    return children;
  }

  _containerTitle(String title) {
    return Container(
      height: 40.w,
      color: Colours.gray_white_color.withOpacity(0.8),
      padding: EdgeInsets.only(left: 2.w, right: 2.w),
      alignment: Alignment.center,
      width: 70.w,
      child: Text(title,
          style: TextStyle(
              fontSize: 13.sp,
              color: Colours.dark_gray_text_color,
              fontWeight: FontWeight.w900),
          textAlign: TextAlign.center),
    );
  }

  _containerContent(String content) {
    return Expanded(
        child: Padding(
      padding: EdgeInsets.only(left: 4.w),
      child: Text(content,
          style: TextStyle(fontSize: 12.sp),
          textAlign: TextAlign.start,
          maxLines: 3,
          overflow: TextOverflow.ellipsis),
    ));
  }

  _verticalDivider() {
    return Container(
      width: 1.w,
      height: 40.w,
      decoration: BoxDecoration(color: Colours.text_gray_c),
    );
  }

  _horizontalDivider() {
    return Container(
      width: double.infinity,
      height: 1.w,
      decoration: BoxDecoration(color: Colours.text_gray_c),
    );
  }
}

class TableDetail {
  String title, content;

  TableDetail(String title, String content) {
    this.title = title;
    this.content = content;
  }
}
