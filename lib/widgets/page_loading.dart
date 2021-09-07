import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zjsb_app/util/color_utils.dart';

class PageLoading extends StatefulWidget {
  final title;
  int type;
  int num;
  PageLoading({this.title, this.type = 1, this.num = 2});

  @override
  _PageLoadingState createState() => _PageLoadingState();
}

class _PageLoadingState extends State<PageLoading> {
  Widget _getUi() {
    switch (widget.type) {
      case 1: //列表
        List<Widget> children = [];

        for (var i = 0; i < widget.num; i++) {
          children.add(SkeletonParagraph());
          children.add(Divider(
            height: 20.w,
          ));
        }

        Widget list = Column(
          children: children,
        );
        return list;

      case 2: //复杂页面
        return Scaffold(
          appBar: AppBar(
            title: Text(
              widget.title,
              style: TextStyle(fontSize: 16.sp),
            ),
            backgroundColor: ColorUtils.getThemeColor(),
          ),
          body: Column(
            children: [
              Divider(),
              SkeletonParagraph(),
              Divider(
                height: 10.w,
              ),
              SkeletonParagraph(
                style: SkeletonParagraphStyle(
                    spacing: 6,
                    lineStyle: SkeletonLineStyle(
                        height: 16,
                        randomLength: true,
                        borderRadius: BorderRadius.circular(16))),
              ),
              Divider(
                height: 20.w,
              ),
              SkeletonParagraph(
                style: SkeletonParagraphStyle(
                    lines: 8,
                    spacing: 6,
                    lineStyle: SkeletonLineStyle(
                      height: 12,
                      randomLength: true,
                    )),
              ),
              Divider(
                height: 20.w,
              ),
              SkeletonParagraph(
                style: SkeletonParagraphStyle(
                    lines: 5,
                    spacing: 8,
                    lineStyle: SkeletonLineStyle(
                      alignment: Alignment.center,
                      height: 12,
                      randomLength: true,
                    )),
              ),
              Divider(),
            ],
          ),
        );
      case 3: //listview
        List<Widget> children = [];

        for (var i = 0; i < widget.num; i++) {
          children.add(SkeletonListView());
          children.add(Divider(
            height: 20.w,
          ));
        }

        Widget list = Column(
          children: children,
        );
        return list;
    }
  }

  @override
  Widget build(BuildContext context) {
    return _getUi();
  }
}
