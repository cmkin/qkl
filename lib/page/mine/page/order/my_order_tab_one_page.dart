import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:zjsb_app/generated/l10n.dart';
import 'package:zjsb_app/page/order/page/order_data.dart';
import 'package:zjsb_app/page/routers/fluro_navigator.dart';
import 'package:zjsb_app/res/colors.dart';
import 'package:zjsb_app/res/dimens.dart';
import 'package:zjsb_app/res/gaps.dart';
import 'package:zjsb_app/util/color_utils.dart';
import 'package:zjsb_app/util/toast.dart';
import 'package:zjsb_app/widgets/data_empty.dart';
import 'package:zjsb_app/widgets/ios_dialog.dart';
import 'package:zjsb_app/widgets/load_image.dart';
import 'package:zjsb_app/widgets/my_app_bar.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zjsb_app/widgets/my_button.dart';

class MyOrderTabOnePage extends StatefulWidget {
  MyOrderTabOnePage(this.title);

  String title;

  @override
  _MessageCenterState createState() => _MessageCenterState();
}

class _MessageCenterState extends State<MyOrderTabOnePage>
    with AutomaticKeepAliveClientMixin {
  List<String> _listData = [
    "a",
    "a",
    "a",
    "a",
    "a",
    "a",
    "a",
    "a",
    "a",
    "a",
  ];
  EasyRefreshController _controller;

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
    TextEditingController _inputController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 5),
      child: Column(
        children: [
          Expanded(child: _refresh(_inputController)),
        ],
      ),
    );
  }

  Widget _refresh(TextEditingController inputController) {
    return EasyRefresh(
      header: BallPulseHeader(),
      footer: BallPulseFooter(),
      controller: _controller,
      child: _cellList(inputController),
      onRefresh: _onRefresh,
      onLoad: _loadMore,
      emptyWidget: _listData.length == 0 ? DataEmpty("${S.of(context).wddd_empty}") : null,
    );
  }

  Widget _cellList(TextEditingController inputController) {
    return ListView.separated(
      itemCount: _listData.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){
            print("点击Item$index");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderDataPage(viewType: 1,),
              ),
            );
          },
          child: Card(
            // 边框
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: ColorUtils.getWhiteBgColor(context),
            child: Container(
              padding: EdgeInsets.only(left: 12, right: 12, top: 5, bottom: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text("${S.of(context).wddd_ddh}：1111111111111111")
                              .fontSize(12)
                              .textColor(Colours.dark_text_gray)),
                      Text(widget.title)
                          .fontSize(13)
                          .textColor(ColorUtils.getThemeColor()),
                    ],
                  ),
                  Gaps.vGap5,
                  Gaps.line,
                  Gaps.vGap10,
                  Row(
                    children: [
                      Expanded(
                          child: Text("存储服务器（分布式）A-50T")
                              .fontSize(15)
                              .textColor(ColorUtils.get2828Color(context))
                              .fontWeight(FontWeight.w800)),
                      Text("x1").fontSize(12).textColor(Colours.dark_text_gray),
                    ],
                  ),
                  Gaps.vGap24,
                  Text("${S.of(context).wddd_xdsj}：2021-06-09 20：28：10")
                      .fontSize(13)
                      .textColor(Colours.dark_text_gray),
                  Gaps.vGap12,
                  Gaps.line,
                  Gaps.vGap5,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith((states) {
                            //设置按下时的背景颜色
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.white;
                            }
                            //默认不使用背景颜色
                            return Colours.btn_gary_color;
                          }),
                          foregroundColor: MaterialStateProperty.resolveWith(
                                (states) {
                              if (states.contains(MaterialState.focused) &&
                                  !states.contains(MaterialState.pressed)) {
                                //获取焦点时的颜色
                                return Colors.white;
                              } else if (states.contains(MaterialState.pressed)) {
                                //按下时的颜色
                                return ColorUtils.getThemeColor();
                              }
                              //默认状态使用灰色
                              return Colors.white;
                            },
                          ),
                          //设置水波纹颜色
                          overlayColor: MaterialStateProperty.all(ColorUtils.getThemeColor().withOpacity(0.3)),
                          //设置按钮内边距
                          padding: MaterialStateProperty.all(EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5)),
                          //设置按钮的大小
                          minimumSize: MaterialStateProperty.all(Size(60, 24)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        child: Text("${S.of(context).wddd_qxdd}").fontSize(14),
                        onPressed: () {
                          print("取消订单$index");
                        },
                      ),
                      Gaps.hGap15,
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith((states) {
                            //设置按下时的背景颜色
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.white;
                            }
                            //默认不使用背景颜色
                            return ColorUtils.getThemeColor();
                          }),
                          foregroundColor: MaterialStateProperty.resolveWith(
                            (states) {
                              if (states.contains(MaterialState.focused) &&
                                  !states.contains(MaterialState.pressed)) {
                                //获取焦点时的颜色
                                return Colors.white;
                              } else if (states.contains(MaterialState.pressed)) {
                                //按下时的颜色
                                return ColorUtils.getThemeColor();
                              }
                              //默认状态使用灰色
                              return Colors.white;
                            },
                          ),
                          //设置水波纹颜色
                          overlayColor: MaterialStateProperty.all(ColorUtils.getThemeColor().withOpacity(0.3)),
                          //设置按钮内边距
                          padding: MaterialStateProperty.all(EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5)),
                          //设置按钮的大小
                          minimumSize: MaterialStateProperty.all(Size(60, 24)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        child: Text("${S.of(context).wddd_qrzf}").fontSize(14),
                        onPressed: () {
                          print("确认支付$index");
                          showDialog<void>(
                              context: context,
                              builder: (_) => IosDialog(
                                cancelBack: false,
                                title: "${S.of(context).wddd_jymm}",
                                message: "${S.of(context).wddd_jymm_text}",
                                isShowInput: true,
                                controller: inputController,
                                onLeftPressed: () {
                                  NavigatorUtils.goBack(context);
                                },
                                onRightPressed: () {
                                  Toast.show(
                                      "按了${inputController.text}");
                                },
                              ));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Gaps.vGap10;
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}


