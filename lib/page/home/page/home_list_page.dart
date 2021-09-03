import 'package:flutter/material.dart';
import 'package:pk_skeleton/pk_skeleton.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zjsb_app/generated/l10n.dart';
import 'package:zjsb_app/page/home/page/tab/tab_one_page.dart';
import 'package:zjsb_app/page/home/page/tab/tab_three_page.dart';
import 'package:zjsb_app/page/home/page/tab/tab_two_page.dart';
import 'package:zjsb_app/page/home/page/test/test_page3.dart';
import 'package:zjsb_app/page/home/widget/my_linear_progress.dart';
import 'package:zjsb_app/res/colors.dart';
import 'package:zjsb_app/util/color_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeListPage extends StatefulWidget {
  const HomeListPage(this.from, {Key key}) : super(key: key);
  final int from;
  @override
  _HomeListPageState createState() => _HomeListPageState();
}

class _HomeListPageState extends State<HomeListPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: Container(
        child: false
            ? PKCardListSkeleton(
                isCircularImage: true,
                isBottomLinesActive: true,
                length: 2,
              )
            : ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    Container(
                  height: 10.h,
                  color: ColorUtils.getWhiteBgColor(context),
                ),
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return Material(
                    child: Ink(
                      decoration: new BoxDecoration(
                        //设置四周圆角 角度
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: InkWell(
                        splashColor: Colours.click_color,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Container(
                          padding: EdgeInsets.all(8.w),
                          decoration: BoxDecoration(
                            color: ColorUtils.getThemeColor().withOpacity(0.08),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //第一行
                              Row(
                                children: [
                                  Expanded(
                                    child: Text("存储服务器（分布式）A-1T")
                                        .fontSize(14.sp)
                                        .textColor(
                                            ColorUtils.get2828Color(context))
                                        .bold(),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colours.home_bg_orange_,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(2.0)),
                                    ),
                                    child: Text("满存版")
                                        .fontSize(10.sp)
                                        .textColor(Colors.white)
                                        .padding(left: 4, right: 4),
                                  )
                                ],
                              ),
                              //第二行
                              Text("${S.of(context).hm_item_syfs} 200 ${S.of(context).dw_fen}")
                                  .fontSize(11.sp)
                                  .textColor(Colours.dark_gray_text_color)
                                  .padding(top: 5, bottom: 3),
                              //进度条
                              MyLinearProgress(0.3, ColorUtils.getThemeColor()),
                              //第四行
                              Padding(
                                padding: EdgeInsets.only(top: 8.w),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                                "${S.of(context).hm_item_cpsj}")
                                            .fontSize(11.sp)
                                            .textColor(
                                                Colours.gray_text_color)),
                                    Text("${S.of(context).hm_item_cpzq}")
                                        .fontSize(11.sp)
                                        .textColor(Colours.gray_text_color)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2.w),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Text("600.79 USDT")
                                            .fontSize(15.sp)
                                            .bold()
                                            .textColor(ColorUtils.get2828Color(
                                                context))),
                                    Text("540${S.of(context).dw_tian}+540${S.of(context).dw_tian}")
                                        .fontSize(11.sp)
                                        .textColor(Colours.gray_text_color)
                                  ],
                                ),
                              ),
                              Text("≈3899 CNY")
                                  .fontSize(11.sp)
                                  .textColor(Colours.dark_gray_text_color)
                                  .padding(top: 3, bottom: 3),
                              Container(
                                margin: EdgeInsets.only(bottom: 4.w),
                                padding: EdgeInsets.only(
                                    left: 15.w,
                                    right: 15.w,
                                    top: 6.w,
                                    bottom: 6.w),
                                decoration: BoxDecoration(
                                  color: ColorUtils.getThemeColor()
                                      .withOpacity(0.15),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(4.0)),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                              "${S.of(context).hm_item_jfq}  3${S.of(context).dw_tian}")
                                          .fontSize(13.sp)
                                          .textColor(Colours.gray_text_color),
                                    ),
                                    Text("${S.of(context).hm_item_qgm} >")
                                        .fontSize(13.sp)
                                        .textColor(ColorUtils.getThemeColor()
                                            .withOpacity(1)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          print("点击列表${widget.from}中的$index");
                          if (widget.from == 1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TabOnePage2(),
                              ),
                            );
                          } else if (widget.from == 2) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TabTwoPage(),
                              ),
                            );
                          } else if (widget.from == 3) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TabThreePage(),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
