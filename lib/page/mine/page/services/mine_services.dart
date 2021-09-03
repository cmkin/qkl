import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:zjsb_app/generated/l10n.dart';
import 'package:zjsb_app/page/home/widget/tab/CustomRRecTabIndicator.dart';
import 'package:zjsb_app/page/home/widget/tab/TabView.dart';
import 'package:zjsb_app/page/mine/widget/mine_app_util.dart';
import 'package:zjsb_app/page/mine/widget/mine_cust_btn.dart';
import 'package:zjsb_app/page/mine/widget/mine_scan.dart';
import 'package:zjsb_app/res/resources.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zjsb_app/util/color_utils.dart';
import 'package:zjsb_app/util/image_utils.dart';
import 'package:zjsb_app/widgets/my_button.dart';
import 'package:zjsb_app/widgets/my_scroll_view.dart';
import 'package:zjsb_app/util/permission_util.dart';

import 'mine_services_record.dart';

class RechargePage extends StatefulWidget {
  final int viewType;

  RechargePage({Key key, this.viewType = 1}) : super(key: key);

  @override
  _RechargePageState createState() => _RechargePageState();
}

class _RechargePageState extends State<RechargePage>
    with SingleTickerProviderStateMixin {
  String url =
      'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Ft2cy.com%2Fd%2Ffile%2Fphone%2Flist%2Fpic%2F2019-11-12%2F022874178abcf489dd70f18897be09e8.jpg&refer=http%3A%2F%2Ft2cy.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1626572511&t=4720ee813f0d4439e25deaac44a79809';
  TabController _tabController;

  //定义一个controller
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    _numberController.dispose();
    super.dispose();
    _nodeText1.unfocus();
    _nodeText2.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.getGrayWhiteBgColor(context),
      appBar: AppBar(
        backgroundColor: ColorUtils.getWhiteBgColor(context),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colours.text_color,
            size: 18,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 1,
        title: Text(
          widget.viewType == 1
              ? S.of(context).mine_service_cz
              : S.of(context).mine_service_tx,
          style: TextStyles.get2828TextStyle(context),
        ).fontSize(16), //.fontWeight(FontWeight.bold),
        centerTitle: true,
        actions: [
          TextButton(
            child: Text(
              widget.viewType == 1
                  ? S.of(context).mine_service_czjl
                  : S.of(context).mine_service_txjl,
              style: TextStyle(
                  color: Colours.text_color.withOpacity(0.6), fontSize: 16),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RechargeRecordPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: MyScrollView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 12, left: 12, right: 12),
            child: Container(
              padding: EdgeInsets.only(top: 12, left: 12, right: 12),
              decoration: BoxDecoration(
                color: ColorUtils.getWhiteBgColor(context),
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          S.of(context).mine_service_lmc + ':',
                          style: TextStyles.get2828TextStyle(context),
                        ).fontWeight(FontWeight.bold),
                      ),
                      Text(
                        S.of(context).mine_service_bz + ':' + ' USDT',
                        style: TextStyles.get6565TextStyle(context),
                      )
                    ],
                  ),
                  Gaps.vGap15,
                  // 按钮
                  Container(
                    height: 32,
                    decoration: BoxDecoration(
                      color: ColorUtils.getGrayWhiteBgColor(context),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(4.0)),
                    ),
                    child: TabBar(
                      key: UniqueKey(),
                      onTap: (index) {},
                      isScrollable: false,
                      controller: _tabController,
                      labelStyle: TextStyles.textBold14,
                      //选中背景和下划线不能同时存在
                      indicator: CustomRRecTabIndicator(
                        radius: 4,
                        color: Colors.white,
                      ),
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorPadding: EdgeInsets.all(3),
                      labelPadding: EdgeInsets.zero,
                      unselectedLabelColor: Colours.dark_text,
                      labelColor: Colours.text,
                      // indicatorPadding:,
                      tabs: const <Widget>[
                        TabView('ERC20'),
                        TabView('TRC20'),
                      ],
                    ),
                  ),
                  Gaps.vGap15,
                  widget.viewType == 1
                      ? Center(
                          child: QrImage(
                            data: '证件',
                            size: 120,
                          ),
                        )
                      : Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                S.of(context).mine_service_txdz + ':',
                                style: TextStyles.get2828TextStyle(context),
                              ).fontSize(13).fontWeight(FontWeight.bold),
                              Gaps.vGap10,
                              Container(
                                height: 40,
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: TextField(
                                      controller: _addressController,
                                      focusNode: _nodeText1,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText:
                                            S.of(context).mine_service_txqkldz,
                                        hintStyle: TextStyle(
                                            color: Colours.ligGray_text_color),
                                      ),
                                    )),
                                    CustBtn(
                                      child: Image(
                                        image: ImageUtils.getAssetImage(
                                            'mine_scann'),
                                        width: 25,
                                        height: 25,
                                      ),
                                      onPressed: () {
                                        _scan();
                                      },
                                    )
                                  ],
                                ),
                              ),
                              // 线条
                              Container(
                                height: 0.1,
                                width: double.infinity,
                                color: Colors.black.withOpacity(1),
                                child: SizedBox(),
                              ),
                            ],
                          ),
                        ),
                  Gaps.vGap10,
                  widget.viewType == 1
                      ? Text(
                          'sfwofwjfowfjwofjwofjw',
                          textAlign: TextAlign.center,
                        )
                      : Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                S.of(context).mine_service_txsl + ':',
                                style: TextStyles.get2828TextStyle(context),
                              ).fontSize(13).fontWeight(FontWeight.bold),
                              Gaps.vGap10,
                              Row(
                                children: [
                                  Expanded(
                                      child: TextField(
                                    controller: _numberController,
                                    focusNode: _nodeText2,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: S.of(context).mine_service_tstx,
                                      hintStyle: TextStyle(
                                          color: Colours.ligGray_text_color),
                                    ),
                                  )),
                                  CustBtn(
                                    child: Text(S.of(context).mine_service_qbtq)
                                        .textColor(
                                            Colors.orange.withOpacity(0.8)),
                                    onPressed: () {},
                                  )
                                ],
                              ),
                              // 线条
                              Container(
                                height: 0.1,
                                width: double.infinity,
                                color: Colors.black.withOpacity(1),
                                child: SizedBox(),
                              ),
                            ],
                          ),
                        ),
                  Gaps.vGap10,
                  widget.viewType == 1
                      ? Flex(
                          direction: Axis.horizontal,
                          children: [
                            Expanded(
                              flex: 1,
                              child: TextButton(
                                child: Text(
                                  S.of(context).mine_service_fzdz,
                                  style: TextStyle(
                                      color: Colours.btn_bg, fontSize: 16),
                                ),
                                onPressed: () {},
                              ),
                            ),
                            Gaps.hGap8,
                            Container(
                              height: 13,
                              width: 1,
                              color: ColorUtils.getGrayWhiteBgColor(context),
                              child: Gaps.line,
                            ),
                            Gaps.hGap8,
                            Expanded(
                              flex: 1,
                              child: TextButton(
                                child: Text(
                                  S.of(context).mine_service_bctp,
                                  style: TextStyle(
                                      color: Colours.btn_bg, fontSize: 16),
                                ),
                                onPressed: () {
                                  _savePhoto();
                                },
                              ),
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            Expanded(child: SizedBox()),
                            Text(
                              S.of(context).mine_service_sxf +
                                  ':' +
                                  ' 0.00 USDT',
                            ).textColor(Colours.ligGray_text_color),
                          ],
                        ),
                  Gaps.vGap10,
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 12, left: 12, right: 12),
            alignment: Alignment.centerLeft,
            child: Container(
              child: Text(
                S.of(context).mine_service_wxts,
                style: TextStyles.get9898TextStyle(context),
              ).fontSize(15).fontWeight(FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 5, left: 12, right: 12),
            alignment: Alignment.centerLeft,
            child: Container(
              child: Text(
                '这里是提示内容，请加入充值规则和或者注意事项',
                style: TextStyles.get9898TextStyle(context),
              ),
            ),
          ),
          widget.viewType == 1 ? Gaps.empty : Gaps.vGap32,
          // 提现按钮
          widget.viewType == 1
              ? Gaps.empty
              : Container(
                  margin: EdgeInsets.only(left: 12, right: 12),
                  child: MyButton(
                    key: const Key('tabone'),
                    onPressed: () {},
                    text: S.of(context).mine_service_tx,
                  ),
                ),
        ],
      ),
    );
  }

  // 保存图片
  Future _savePhoto() async {
    AppUtil.saveImage(url);
  }

  // 扫描二维码
  Future _scan() async {
    // 获取相机权限
    final isCamera = await ConstConfig.perssionRequest(TKPermission.camera);
    final isStorage = await ConstConfig.perssionRequest(TKPermission.storage);
    if (isCamera && isStorage) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScanPage(),
        ),
      ).then((value) {
        setState(() {
          _addressController.text = value;
        });
      });
    }
  }
}
