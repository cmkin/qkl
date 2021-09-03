import 'package:styled_widget/styled_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zjsb_app/generated/l10n.dart';
import 'package:zjsb_app/mvp/base_page.dart';
import 'package:zjsb_app/page/login/login_router.dart';
import 'package:zjsb_app/page/mine/iview/mine_account_iview.dart';
import 'package:zjsb_app/page/mine/presenter/mine_presenter.dart';
import 'package:zjsb_app/page/routers/fluro_navigator.dart';
import 'package:zjsb_app/res/colors.dart';
import 'package:zjsb_app/res/gaps.dart';
import 'package:zjsb_app/res/styles.dart';
import 'package:zjsb_app/util/color_utils.dart';
import 'package:zjsb_app/widgets/my_button.dart';
import 'package:zjsb_app/widgets/my_scroll_view.dart';
import 'package:zjsb_app/widgets/oktoast_expand.dart';

class ResetLoginPwdPage extends StatefulWidget {
  // 重置类型  1 登录密码  2 交易密码
  final int type;
  ResetLoginPwdPage({Key key, this.type = 1}) : super(key: key);
  @override
  _ResetLoginPwdPageState createState() => _ResetLoginPwdPageState();
}

class _ResetLoginPwdPageState extends State<ResetLoginPwdPage> {
  //定义一个controller
  final TextEditingController _newPwdController = TextEditingController();
  final TextEditingController _newPwd1Controller = TextEditingController();
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          widget.type == 1
              ? S.of(context).account_czdlmm
              : S.of(context).account_czjymm,
          style: TextStyles.get2828TextStyle(context),
        ).fontSize(16), //.fontWeight(FontWeight.bold),
        centerTitle: true,
      ),
      backgroundColor: ColorUtils.getGrayWhiteBgColor(context),
      body: MyScrollView(
        children: [
          Container(
              padding: EdgeInsets.only(left: 12, right: 12, top: 10),
              child: Text(
                S.of(context).account_czgz,
                style: TextStyles.get6565TextStyle(context),
              ).fontSize(15)),
          Gaps.vGap10,
          // 新密码
          Container(
            height: 50,
            color: ColorUtils.getWhiteBgColor(context),
            child: Container(
              padding: EdgeInsets.only(left: 12, right: 12),
              child: Row(
                children: [
                  SizedBox(
                    width: 120,
                    child: Text(
                      S.of(context).account_xmm,
                      style: TextStyles.get2828TextStyle(context),
                    ).fontWeight(FontWeight.bold),
                  ),
                  Gaps.hGap10,
                  Expanded(
                      child: TextField(
                    controller: _newPwdController,
                    focusNode: _nodeText1,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: S.of(context).account_xmmts,
                      hintStyle: TextStyle(color: Colours.ligGray_text_color),
                    ),
                  )),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 1,
          ),
          // 确认密码
          Container(
            height: 50,
            color: ColorUtils.getWhiteBgColor(context),
            child: Container(
              padding: EdgeInsets.only(left: 12, right: 12),
              child: Row(
                children: [
                  SizedBox(
                    width: 120,
                    child: Text(
                      S.of(context).account_qrxmm,
                      style: TextStyles.get2828TextStyle(context),
                    ).fontWeight(FontWeight.bold),
                  ),
                  Gaps.hGap10,
                  Expanded(
                      child: TextField(
                    controller: _newPwd1Controller,
                    focusNode: _nodeText2,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: S.of(context).account_qzcsrxmm,
                      hintStyle: TextStyle(color: Colours.ligGray_text_color),
                    ),
                  )),
                ],
              ),
            ),
          ),
          Gaps.vGap50,
          Container(
            margin: EdgeInsets.only(left: 12, right: 12),
            child: MyButton(
              key: const Key('code'),
              onPressed: () {
                if (widget.type == 1) {
                  JhToast2.showSuccess(S.of(context).login_tis);
                  // 重置登录密码
                  NavigatorUtils.push(context, LoginRouter.loginPage,
                      replace: true, clearStack: true);
                }
              },
              text: S.of(context).login_done,
            ),
          ),
        ],
      ),
    );
  }
  // @override
  // MinePagePresenter createPresenter() => MinePagePresenter();
}
