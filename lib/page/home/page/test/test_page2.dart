import 'package:flutter/material.dart';
import '../../../../widgets/swiper/swiper_widget.dart';
import 'package:zjsb_app/util/image_utils.dart';

class TestPage2 extends StatefulWidget {
  @override
  _TestPage2State createState() => _TestPage2State();
}

class _TestPage2State extends State<TestPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeContent(),
    );
  }
}

class HomeContent extends StatelessWidget {
  List<String> swiperList = [
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Ft2cy.com%2Fd%2Ffile%2Fphone%2Flist%2Fpic%2F2019-11-12%2F022874178abcf489dd70f18897be09e8.jpg&refer=http%3A%2F%2Ft2cy.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1626572511&t=4720ee813f0d4439e25deaac44a79809",
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Ft2cy.com%2Fd%2Ffile%2Fphone%2Flist%2Fpic%2F2019-11-12%2Fce990c79782d49dcba427cc1a16145b6.jpg&refer=http%3A%2F%2Ft2cy.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1626572558&t=52540e6031a1e2a6002e54e895a3ca5f",
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic.jj20.com%2Fup%2Fallimg%2F1113%2F060320112631%2F200603112631-5-1200.jpg&refer=http%3A%2F%2Fpic.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1626575426&t=056297555e223818c83dc5d465e00ba1",
    "https://img1.baidu.com/it/u=1575169871,3281166747&fm=26&fmt=auto&gp=0.jpg"
  ];

  HomeContent({Key key}) : super(key: key);

  List _list = List.generate(20, (index) => 'Item - $index');

  Widget _builder(context, index) {
    return ListTile(title: Text(_list[index]));
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        leading: new IconButton(
          tooltip: '返回上一页',
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        // backgroundColor: Colors.pink,
        //是否应该在用户滚动时变得可见 比如pinned 为false可滑出屏幕 当向下滑时可先滑出 状态栏
        floating: true,
        //当手指放开时，SliverAppBar是否会根据当前的位置展开/收起
        snap: false,
        //appBar是否置顶 是否固定在顶部 为true是固定，为false是不固定可滑出屏幕
        pinned: true,
        //展开的高度
        expandedHeight: 220,
        //折叠后的高度
        collapsedHeight: 76,
        flexibleSpace: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            SwiperWidget(
              swiperList,
              isShowBottom: true,
              height: 276,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
              ),
              width: double.infinity,
              height: 20,
            ),
          ],
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          _builder,
          childCount: _list.length,
        ),
      ),
    ]);
  }
}
