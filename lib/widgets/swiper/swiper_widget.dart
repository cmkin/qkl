import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zjsb_app/util/image_utils.dart';
import 'package:zjsb_app/widgets/load_image.dart';
import 'package:zjsb_app/widgets/swiper/swiper.dart';
import 'package:zjsb_app/widgets/swiper/swiper_pagination.dart';

//轮播图
class SwiperWidget extends StatefulWidget {
  const SwiperWidget(
    this.list, {
    this.height,
    this.isShowBottom = false,
    this.radius = 0,
    Key key,
  }) : super(key: key);

  final List<String> list;
  final double height;
  final bool isShowBottom;
  final double radius;

  @override
  _SwiperWidgetState createState() => _SwiperWidgetState();
}

class _SwiperWidgetState extends State<SwiperWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      child: Swiper(
        // 横向
        scrollDirection: Axis.horizontal,
        // 布局构建
        itemBuilder: (BuildContext context, int index) {
          return Center(
              child: Container(
            width: double.infinity,
            height: widget.height,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(widget.radius),
              child: LoadImage(widget.list[index]),
            ),
          ));
        },
        //条目个数
        itemCount: widget.list.length,
        // 自动翻页
        autoplay: true,
        // 分页指示
        pagination: _buildPlugin(),
        // pagination: _buildSwiperPagination(),
        // pagination: _buildNumSwiperPagination(),
        //点击事件
        onTap: (index) {
          print(" 点击 " + index.toString());
        },
        // 相邻子条目视窗比例
        viewportFraction: 1,
        // 用户进行操作时停止自动翻页
        autoplayDisableOnInteraction: true,
        // 无限轮播
        loop: true,
        //当前条目的缩放比例
        scale: 1,
        autoplayDelay: 3000,
        duration: 300,
      ),
    );
  }

  //默认圆点指示器
  _buildPlugin() {
    return widget.isShowBottom
        ? SwiperPagination(
            //指示器显示的位置 Alignment.bottomCenter 底部中间
            alignment: Alignment.bottomCenter,
            // 距离调整
            margin: const EdgeInsets.only(bottom: 25),
            // 指示器构建
            builder: SwiperPagination.rect,
          )
        : SwiperPagination(builder: SwiperPagination.rect);
  }
}
