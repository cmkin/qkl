import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:zjsb_app/generated/l10n.dart';
import 'package:zjsb_app/res/gaps.dart';
import 'package:zjsb_app/res/resources.dart';
import 'package:zjsb_app/util/color_utils.dart';
import 'package:zjsb_app/widgets/data_empty.dart';
import 'package:styled_widget/styled_widget.dart';

class SevicesListPage extends StatefulWidget {
  final int viewType;
  final int selectIndex;
  SevicesListPage({Key key,this.viewType = 1,this.selectIndex}):super(key: key);

  @override
  _SevicesListPageState createState() => _SevicesListPageState();
}

class _SevicesListPageState extends State<SevicesListPage> {
  EasyRefreshController _controller;
  List<String> _listData = ['','',''];

  int _page = 1;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // 下拉刷新
  Future _onRefresh({bool isShow = false}) async {
    await Future.delayed(const Duration(seconds: 1), () {
      _page = 1;
      setState(() {});
    });
  }

  Future _loadMore() async {
    await Future.delayed(const Duration(seconds: 1), () {
      _page++;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Expanded(child: _refresh()),
      ],
    );
  }
  // 刷新
  Widget _refresh() {
    return EasyRefresh(
      header: BallPulseHeader(),
      footer: BallPulseFooter(),
      controller: _controller,
      child: _cellList(),
      onRefresh: _onRefresh,
      onLoad: _loadMore,
      emptyWidget: _listData.length == 0 ? DataEmpty("暂无订单") : null,
    );
  }
  // 列表
  Widget  _cellList(){
    return ListView.separated(itemBuilder: (context,index){
      return  itemCell();
    }, separatorBuilder: (context ,index){
      return Gaps.empty;
    }, itemCount: _listData.length);
  }
  // item
  Widget itemCell(){
    return Container(
      padding: EdgeInsets.only(left: 12,right: 12,top: 10,bottom: 5),
      color: ColorUtils.getGrayWhiteBgColor(context),
      child: Container(
        padding: EdgeInsets.only(left: 12,right: 12,top: 10),
        decoration: BoxDecoration(
          color: ColorUtils.getWhiteBgColor(context),
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 数量
            Row(
              children: [
                Expanded(child: Text.rich(TextSpan(
                  children: [
                    TextSpan(
                      text: widget.viewType == 1 ? S.of(context).mine_service_czsl+':  ' : S.of(context).mine_service_txsl+':  ' ,style: TextStyles.get2828TextStyle(context)
                    ).fontWeight(FontWeight.bold),
                    TextSpan(
                        text: '1000.00 USDT',style: TextStyles.get6565TextStyle(context)
                    ),
                  ]
                ))),
                Text(S.of(context).mine_record_clz,style: TextStyles.get6565TextStyle(context),)
              ],
            ),
            Gaps.vGap10,
            // 地址
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.viewType == 1 ? S.of(context).mine_service_czdz+':  ' : S.of(context).mine_service_txdz+':  ',style: TextStyles.get2828TextStyle(context),).fontWeight(FontWeight.bold),
                Expanded(child: Text('为我服务奇偶玩叫我放假我佛我奇偶费我我我积分我服务',maxLines: 100,style: TextStyle(fontSize: 14,color: Colours.gray_text_color,),))
              ],
            ),
            Gaps.vGap10,
            // 线条
            Container(
              height: 0.1,
              width: double.infinity,
              color: Colors.black.withOpacity(1),
              child: SizedBox(),
            ),
            Gaps.vGap10,
            Row(
              children: [
                Expanded(child: SizedBox()),
                Text('2021-07-02 20:13:34',style: TextStyles.get9898TextStyle(context),)
              ],
            ),
            Gaps.vGap10
          ],
        ),

      ),
    );
  }
}
