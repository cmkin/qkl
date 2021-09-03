

import 'package:flutter/material.dart';
import 'package:zjsb_app/common/common.dart';
import 'package:zjsb_app/util/color_utils.dart';
import 'package:zjsb_app/widgets/my_scroll_view.dart';
import '../../../../widgets/swiper/swiper_widget.dart';

class TestPage3 extends StatefulWidget {
  @override
  _TestPage3State createState() => _TestPage3State();
}

class _TestPage3State extends State<TestPage3> with SingleTickerProviderStateMixin{

  final ValueNotifier<double> headerNegativeOffset = ValueNotifier<double>(0);
  final ValueNotifier<bool> appbarShadow = ValueNotifier<bool>(false);

  final double maxHeaderHeight = 250.0;
  final double minHeaderHeight = 56.0;
  final double bodyContentRatioMin = .8;
  final double bodyContentRatioMax = 1.0;

  ///must be between min and max values of body content ratio.
  final double bodyContentRatioParallax = .9;
  List<String> swiperList = [
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Ft2cy.com%2Fd%2Ffile%2Fphone%2Flist%2Fpic%2F2019-11-12%2F022874178abcf489dd70f18897be09e8.jpg&refer=http%3A%2F%2Ft2cy.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1626572511&t=4720ee813f0d4439e25deaac44a79809",
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Ft2cy.com%2Fd%2Ffile%2Fphone%2Flist%2Fpic%2F2019-11-12%2Fce990c79782d49dcba427cc1a16145b6.jpg&refer=http%3A%2F%2Ft2cy.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1626572558&t=52540e6031a1e2a6002e54e895a3ca5f",
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic.jj20.com%2Fup%2Fallimg%2F1113%2F060320112631%2F200603112631-5-1200.jpg&refer=http%3A%2F%2Fpic.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1626575426&t=056297555e223818c83dc5d465e00ba1",
    "https://img1.baidu.com/it/u=1575169871,3281166747&fm=26&fmt=auto&gp=0.jpg"
  ];
  ScrollController _mScrollController = new ScrollController();

  ScrollController _controller = new ScrollController();
  Color _naviColor = Colors.transparent;
  double _elevation = 0;
  bool _isNeedSetAlpha = false;


  @override
  void dispose() {
    headerNegativeOffset.dispose();
    appbarShadow.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.orange,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: Container(
          color: Colors.red,
        ),
      ),
      body: Stack(
        children: [
          CustomScrollView(
            controller: _mScrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  child: Text('data'),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 400,
                  child: SizedBox(),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 400,
                  child: Text('data'),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 400,
                  child: Text('data'),
                ),
              ),
            ],
          ),
          // CustomTitleBar(
          //   height: 80,
          //   // controller: _mCustomTitleBarController,
          //   // key: _mTitleKey,
          //
          // ),
        ],
      ),
    );
  }
}
