import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zjsb_app/generated/l10n.dart';
import 'package:zjsb_app/page/home/widget/tab/show_list_chip.dart';
import 'package:zjsb_app/res/gaps.dart';
import 'package:zjsb_app/res/resources.dart';
import 'package:zjsb_app/util/color_utils.dart';
import 'package:zjsb_app/util/image_utils.dart';
import 'package:zjsb_app/widgets/my_button.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zjsb_app/widgets/my_scroll_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef showSuccess<T> = void Function(T data);

class ShowBuy {
  static ShowBuy get instance => ShowBuy();

  // viewType  1 云设备  2 独享设备  3 联合设备
  Future show(BuildContext context, int viewType, showSuccess success) {
    List textList = ['中间', '出差', '早饭'];
    // 服务器
    String severStr = '';
    // 周期
    String cycleStr = '';
    //
    String str = '';
    String numberStr = '';
    String gasStr = '';
    // 购买份数
    int buyNumber = 0;
    int gas = 0;
    showModalBottomSheet(
        context: context,
        isScrollControlled: false,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12))),
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setDialogState) {
            return Container(
              padding: EdgeInsets.only(left: 12.w, right: 12.w),
              child: Column(
                children: [
                  Expanded(
                    child: MyScrollView(
                      children: [
                        Gaps.vGap15,
                        // 取消按钮
                        Row(
                          children: [
                            Expanded(child: SizedBox()),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Image(
                                image: ImageUtils.getAssetImage('del'),
                                width: 20.w,
                                height: 20.w,
                              ),
                            ),
                          ],
                        ),
                        // 总价 标题
                        Center(
                          child: Text.rich(TextSpan(children: [
                            TextSpan(
                                text: S.of(context).buy_total_price,
                                style: TextStyles.get6565TextStyle(context)),
                            TextSpan(text: ' 600.97')
                                .textColor(ColorUtils.getThemeColor())
                                .fontSize(18.sp)
                                .fontWeight(FontWeight.bold),
                            TextSpan(text: ' USDT')
                                .textColor(ColorUtils.getThemeColor())
                                .fontSize(10.sp)
                                .fontWeight(FontWeight.bold),
                          ])),
                        ),
                        Gaps.vGap5,
                        // 选择规格
                        Center(
                          child: Container(
                            color: Colors.black.withOpacity(0.1),
                            padding: EdgeInsets.only(
                                left: 8.w, right: 8.w, top: 3.w, bottom: 3.w),
                            child: Text(S.of(context).buy_select_Spec +
                                    ':' +
                                    severStr +
                                    cycleStr +
                                    str +
                                    numberStr +
                                    gasStr)
                                .fontSize(11.sp)
                                .textColor(Colours.gray_text_color),
                          ),
                        ),
                        Gaps.vGap15,
                        // 服务器
                        ShowListChip(
                            titleStr: S.of(context).buy_storage_server,
                            textList: ['540天', '540天+430天', '我'],
                            cellType: 1,
                            fontWeight: FontWeight.bold,
                            valueChanged: (int index) {
                              setDialogState(() {
                                severStr = ' ' + textList[index];
                              });
                            }),
                        Gaps.vGap5,
                        ShowListChip(
                          titleStr: S.of(context).buy_first_service_cycle,
                          textList: textList,
                          valueChanged: (int index) {
                            setDialogState(() {
                              cycleStr = ' ' + textList[index];
                            });
                          },
                        ),
                        Gaps.vGap5,
                        viewType == 2
                            ? ShowListChip(
                                titleStr: S.of(context).buy_speed_day,
                                textList: textList,
                                valueChanged: (int index) {
                                  setDialogState(() {
                                    str = ' ' + textList[index];
                                  });
                                })
                            : Gaps.empty,
                        //
                        Container(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: Text(S.of(context).buy_buy_fen,
                                          style: TextStyles.get2828TextStyle(
                                              context))),
                                  Container(
                                    height: 50.w,
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setDialogState(() {
                                              if (buyNumber < 1) {
                                                buyNumber = 0;
                                              } else {
                                                buyNumber -= 1;
                                              }
                                              numberStr = buyNumber == 0
                                                  ? ''
                                                  : ' ' +
                                                      buyNumber.toString() +
                                                      '份';
                                            });
                                          },
                                          child: Container(
                                            height: 30.w,
                                            width: 30.w,
                                            alignment: Alignment.center,
                                            color:
                                                Colors.black26.withOpacity(0.1),
                                            child: Text(
                                              '一',
                                              style:
                                                  TextStyles.get6565TextStyle(
                                                      context),
                                            ),
                                          ),
                                        ),
                                        Gaps.hGap12,
                                        Text(buyNumber.toString())
                                            .fontWeight(FontWeight.bold)
                                            .fontSize(16.sp),
                                        Gaps.hGap12,
                                        GestureDetector(
                                          onTap: () {
                                            setDialogState(() {
                                              buyNumber += 1;
                                              numberStr = ' ' +
                                                  buyNumber.toString() +
                                                  '份';
                                            });
                                          },
                                          child: Container(
                                            height: 30.w,
                                            width: 30.w,
                                            alignment: Alignment.center,
                                            color:
                                                Colors.black26.withOpacity(0.1),
                                            child: Text(
                                              '十',
                                              style:
                                                  TextStyles.get6565TextStyle(
                                                      context),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              // 线条
                              Container(
                                height: 0.1,
                                width: 1.sw - 24.w,
                                color: Colors.black.withOpacity(1),
                                child: SizedBox(),
                              ),
                            ],
                          ),
                        ),
                        viewType == 2
                            ? Container(
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Text(S.of(context).buy_gas_t,
                                            style: TextStyles.get2828TextStyle(
                                                context))),
                                    Container(
                                      height: 50.w,
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setDialogState(() {
                                                if (gas < 1) {
                                                  gas = 0;
                                                } else {
                                                  gas -= 1;
                                                }
                                              });
                                            },
                                            child: Container(
                                              height: 30.w,
                                              width: 30.w,
                                              alignment: Alignment.center,
                                              color: Colors.black26
                                                  .withOpacity(0.1),
                                              child: Text(
                                                '一',
                                                style:
                                                    TextStyles.get6565TextStyle(
                                                        context),
                                              ),
                                            ),
                                          ),
                                          Gaps.hGap12,
                                          Text(gas.toString())
                                              .fontWeight(FontWeight.bold)
                                              .fontSize(16.sp),
                                          Gaps.hGap12,
                                          Text(
                                            'FIL',
                                            style: TextStyles.get9898TextStyle(
                                                context),
                                          ),
                                          Gaps.hGap5,
                                          GestureDetector(
                                            onTap: () {
                                              setDialogState(() {
                                                gas += 1;
                                              });
                                            },
                                            child: Container(
                                              height: 30.w,
                                              width: 30.w,
                                              alignment: Alignment.center,
                                              color: Colors.black26
                                                  .withOpacity(0.1),
                                              child: Text(
                                                '十',
                                                style:
                                                    TextStyles.get6565TextStyle(
                                                        context),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Gaps.empty,
                        Gaps.vGap10
                      ],
                    ),
                  ),
                  MyButton(
                    key: const Key('login'),
                    onPressed: () {
                      success('111111');
                    },
                    text: S.of(context).buy_submit_order,
                  ),
                  Gaps.vGap24,
                ],
              ),
            );
          });
        });
  }
}
