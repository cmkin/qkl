import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zjsb_app/generated/l10n.dart';
import 'package:zjsb_app/page/routers/fluro_navigator.dart';
import 'package:zjsb_app/res/resources.dart';
import 'package:zjsb_app/util/color_utils.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zjsb_app/util/image_utils.dart';
import 'package:zjsb_app/util/toast.dart';
import 'package:zjsb_app/widgets/ios_dialog.dart';
import 'package:zjsb_app/widgets/my_app_bar.dart';
import 'package:zjsb_app/widgets/my_button.dart';
import 'package:zjsb_app/widgets/my_scroll_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDataPage extends StatefulWidget {
  // 类型  1 订单详情  2 支付完成
  final int viewType;

  OrderDataPage({Key key, this.viewType = 1}) : super(key: key);

  @override
  _OrderDataPageState createState() => _OrderDataPageState();
}

class _OrderDataPageState extends State<OrderDataPage> {
  // 是否同意
  bool _agreeClick = false;
  // 支付方式
  int _paymentMethod = 0;
  TextEditingController _inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // 展开的高度
    double headerH = widget.viewType == 1 ? 200.sp : 220.sp;
    return Scaffold(
      backgroundColor: ColorUtils.getGrayWhiteBgColor(context),
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: ColorUtils.getThemeColor(),
                  title: Text(widget.viewType == 2
                          ? S.of(context).order_order_detail
                          : S.of(context).tab2_title)
                      .textColor(Colors.white)
                      .fontSize(16.sp),
                  centerTitle: true,
                  leading: new IconButton(
                    tooltip: '返回上一页',
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 18.sp,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  actions: [
                    widget.viewType == 2
                        ? Gaps.empty
                        : TextButton(
                            child: Text(
                              S.of(context).order_cancel_order,
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 16.sp),
                            ),
                            onPressed: () {},
                          ),
                  ],
                  pinned: true,
                  //展开的高度
                  expandedHeight: headerH,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        Container(
                          // height: 180,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                ColorUtils.getThemeColor(),
                                ColorUtils.getGrayWhiteBgColor(context)
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 12.w,
                          right: 12.w,
                          bottom: 10.w,
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 12.w, top: 10.w, right: 12.w),
                            width: 1.sw - 24.w,
                            decoration: BoxDecoration(
                              color: ColorUtils.getWhiteBgColor(context),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                        widget.viewType == 2
                                            ? S
                                                .of(context)
                                                .order_order_completed
                                            : S.of(context).order_to_be_paid,
                                        style: TextStyles.get2828TextStyle(
                                            context))
                                    .fontWeight(FontWeight.bold)
                                    .fontSize(18.sp),
                                Gaps.vGap12,
                                Text.rich(TextSpan(children: [
                                  TextSpan(
                                          text:
                                              S.of(context).order_create_time +
                                                  ':  ',
                                          style: TextStyles.get6565TextStyle(
                                              context))
                                      .fontSize(13.sp),
                                  TextSpan(
                                          text: '2021-03-43',
                                          style: TextStyles.get2828TextStyle(
                                              context))
                                      .fontSize(13.sp),
                                ])),
                                Gaps.vGap5,
                                widget.viewType == 2
                                    ? Text.rich(TextSpan(children: [
                                        TextSpan(
                                                text: S
                                                        .of(context)
                                                        .order_payment_time +
                                                    ':  ',
                                                style:
                                                    TextStyles.get6565TextStyle(
                                                        context))
                                            .fontSize(13.sp),
                                        TextSpan(
                                                text: '2021-03-43',
                                                style:
                                                    TextStyles.get2828TextStyle(
                                                        context))
                                            .fontSize(13.sp),
                                      ]))
                                    : Gaps.empty,
                                Gaps.vGap12,
                                Container(
                                  height: 30.w,
                                  padding:
                                      EdgeInsets.only(left: 12.w, right: 12.w),
                                  decoration: BoxDecoration(
                                    color:
                                        ColorUtils.getGrayWhiteBgColor(context),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Row(
                                        children: [
                                          Text(
                                                  S
                                                          .of(context)
                                                          .order_order_number +
                                                      ': ',
                                                  style: TextStyles
                                                      .get6565TextStyle(
                                                          context))
                                              .fontSize(13.sp),
                                          Expanded(
                                            child: Text(
                                                    'sdkwof12313131232343423234',
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyles
                                                        .get2828TextStyle(
                                                            context))
                                                .fontSize(13.sp),
                                          ),
                                        ],
                                      )),
                                      MyButton(
                                        btnH: 30.w,
                                        btnW: 35.w,
                                        fontSize: 13.sp,
                                        onPressed: () {
                                          ClipboardData data =
                                              new ClipboardData(text: "复制的内容");
                                          Clipboard.setData(data);
                                        },
                                        text: S.of(context).order_order_copy,
                                      ),
                                    ],
                                  ),
                                ),
                                Gaps.vGap12,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 5.w),
                    color: ColorUtils.getGrayWhiteBgColor(context),
                    child: Container(
                      padding:
                          EdgeInsets.only(left: 12.w, right: 12.w, top: 10.w),
                      decoration: BoxDecoration(
                        color: ColorUtils.getWhiteBgColor(context),
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(S.of(context).buy_storage_server,
                                  style: TextStyles.get2828TextStyle(context))
                              .fontWeight(FontWeight.bold),
                          Gaps.vGap10,
                          Container(
                            height: 0.1,
                            width: double.infinity,
                            color: Colors.black.withOpacity(1),
                            child: SizedBox(),
                          ),
                          Gaps.vGap10,
                          Row(
                            children: [
                              Expanded(
                                child: Text(S.of(context).buy_buy_fen,
                                        style: TextStyles.get9898TextStyle(
                                            context))
                                    .fontSize(16.sp),
                              ),
                              Text(
                                'x1',
                                style: TextStyles.get6565TextStyle(context),
                              ).fontSize(16.sp)
                            ],
                          ),
                          Gaps.vGap10,
                          Container(
                            height: 0.1,
                            width: double.infinity,
                            color: Colors.black.withOpacity(1),
                            child: SizedBox(),
                          ),
                          Gaps.vGap10,
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                        S.of(context).order_device_total_price,
                                        style: TextStyles.get9898TextStyle(
                                            context))
                                    .fontSize(16.sp),
                              ),
                              Text(
                                '600.79 USDT',
                                style: TextStyles.get6565TextStyle(context),
                              ).fontSize(16.sp)
                            ],
                          ),
                          Gaps.vGap10,
                          Container(
                            height: 0.1,
                            width: double.infinity,
                            color: Colors.black.withOpacity(1),
                            child: SizedBox(),
                          ),
                          Gaps.vGap10,
                          Row(
                            children: [
                              Expanded(
                                child: Text(S.of(context).order_service_cycle,
                                        style: TextStyles.get9898TextStyle(
                                            context))
                                    .fontSize(16.sp),
                              ),
                              Text(
                                '540' + S.of(context).dw_tian,
                                style: TextStyles.get6565TextStyle(context),
                              ).fontSize(16.sp)
                            ],
                          ),
                          Gaps.vGap10,
                        ],
                      ),
                    ),
                  ),
                ),
                // 提示文字说明
                SliverToBoxAdapter(
                  child: widget.viewType == 2
                      ? Gaps.empty
                      : Container(
                          padding: EdgeInsets.only(top: 10.w, right: 12.w),
                          child: Text(
                            S.of(context).order_order_mark,
                            textAlign: TextAlign.right,
                            style: TextStyles.get9898TextStyle(context),
                          ),
                        ),
                ),
                // 支付方式
                SliverToBoxAdapter(
                  child: widget.viewType == 2
                      ? Gaps.empty
                      : Container(
                          padding: EdgeInsets.only(
                              left: 12.w, right: 12.w, top: 5.w),
                          color: ColorUtils.getGrayWhiteBgColor(context),
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 12.w, right: 12.w, top: 10.w),
                            decoration: BoxDecoration(
                              color: ColorUtils.getWhiteBgColor(context),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(S.of(context).order_payment_method,
                                        style: TextStyles.get2828TextStyle(
                                            context))
                                    .fontWeight(FontWeight.bold),
                                Gaps.vGap10,
                                Container(
                                  height: 0.1,
                                  width: double.infinity,
                                  color: Colors.black.withOpacity(1),
                                  child: SizedBox(),
                                ),
                                Gaps.vGap10,
                                Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Image(
                                            image: ImageUtils.getAssetImage(
                                                'money'),
                                            width: 20.w,
                                            height: 20.w,
                                          ),
                                          Gaps.hGap4,
                                          Text(S.of(context).order_usdt_payment,
                                                  style: TextStyles
                                                      .get2828TextStyle(
                                                          context))
                                              .fontSize(16.sp),
                                        ],
                                      ),
                                    ),
                                    Checkbox(
                                        shape: CircleBorder(),
                                        activeColor: ColorUtils.getThemeColor(),
                                        value:
                                            _paymentMethod == 0 ? true : false,
                                        onChanged: (value) {
                                          setState(() {
                                            _paymentMethod = 0;
                                          });
                                        }),
                                  ],
                                ),
                                Gaps.vGap10,
                                Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Image(
                                            image: ImageUtils.getAssetImage(
                                                'money_1'),
                                            width: 20.w,
                                            height: 20.w,
                                          ),
                                          Gaps.hGap4,
                                          Text(S.of(context).order_cny_payment,
                                                  style: TextStyles
                                                      .get2828TextStyle(
                                                          context))
                                              .fontSize(16.sp),
                                        ],
                                      ),
                                    ),
                                    Checkbox(
                                        shape: CircleBorder(),
                                        activeColor: ColorUtils.getThemeColor(),
                                        value:
                                            _paymentMethod == 1 ? true : false,
                                        onChanged: (value) {
                                          setState(() {
                                            _paymentMethod = 1;
                                          });
                                        }),
                                  ],
                                ),
                                Gaps.vGap10,
                              ],
                            ),
                          ),
                        ),
                ),
                // 提示文字说明
                SliverToBoxAdapter(
                  child: widget.viewType == 2
                      ? Gaps.empty
                      : Container(
                          padding: EdgeInsets.only(
                            top: 5.w,
                          ),
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Checkbox(
                                  shape: CircleBorder(),
                                  activeColor: ColorUtils.getThemeColor(),
                                  value: _agreeClick,
                                  onChanged: (value) {
                                    setState(() {
                                      _agreeClick = value;
                                    });
                                  }),
                              // Gaps.hGap4,
                              Expanded(
                                child: Text.rich(TextSpan(children: [
                                  TextSpan(
                                      text: S.of(context).sd_agree,
                                      style:
                                          TextStyles.get6565TextStyle(context)),
                                  TextSpan(
                                      text: '《' +
                                          S.of(context).sd_service_agreement +
                                          '》',
                                      style: TextStyle(
                                          color: ColorUtils.getThemeColor(),
                                          fontSize: 13.sp)),
                                  TextSpan(
                                      text: S.of(context).sd_and,
                                      style:
                                          TextStyles.get6565TextStyle(context)),
                                  TextSpan(
                                      text: '《' +
                                          S.of(context).sd_consent_purchase +
                                          '》',
                                      style: TextStyle(
                                          color: ColorUtils.getThemeColor(),
                                          fontSize: 13.sp)),
                                ])),
                              )
                            ],
                          ),
                        ),
                ),
              ],
            ),
          ),
          widget.viewType == 2
              ? Gaps.empty
              : Container(
                  height: 60.w,
                  padding: EdgeInsets.only(left: 12.w, right: 12.w),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text.rich(TextSpan(children: [
                            TextSpan(
                                    text: S.of(context).buy_total_price + ' ',
                                    style: TextStyles.get6565TextStyle(context))
                                .fontSize(13.sp),
                            TextSpan(
                                text: '600.79',
                                style: TextStyle(
                                    color: ColorUtils.getThemeColor(),
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                    text: ' USDT',
                                    style: TextStyles.get6565TextStyle(context))
                                .textColor(ColorUtils.getThemeColor()),
                          ])),
                          Text(
                            S.of(context).sd_account_balance +
                                ': ' +
                                '10082USDT',
                            style: TextStyles.get6565TextStyle(context),
                          ).fontSize(12.sp)
                        ],
                      )),
                      MyButton(
                          text: S.of(context).order_confirm_payment,
                          btnW: 100.w,
                          btnH: 40.w,
                          fontSize: 16.sp,
                          onPressed: () {
                            showDialog<void>(
                                context: context,
                                builder: (_) => IosDialog(
                                      cancelBack: false,
                                      title:
                                          S.of(context).order_traansaction_code,
                                      message: S.of(context).order_show_payment,
                                      isShowInput: true,
                                      controller: _inputController,
                                      onLeftPressed: () {
                                        NavigatorUtils.goBack(context);
                                      },
                                      onRightPressed: () {
                                        Toast.show(
                                            "按了${_inputController.text}");
                                      },
                                    ));
                          })
                    ],
                  ),
                ),
          widget.viewType == 2 ? Gaps.empty : Gaps.vGap15,
        ],
      ),
    );
  }
}
