import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_box/verification_box.dart';
import 'package:zjsb_app/generated/l10n.dart';
import 'package:zjsb_app/page/mine/page/account_safety/reset_loginpwd_page.dart';
import 'package:zjsb_app/res/colors.dart';
import 'package:zjsb_app/res/gaps.dart';
import 'package:zjsb_app/res/styles.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zjsb_app/util/color_utils.dart';
import 'package:zjsb_app/widgets/my_button.dart';
import 'package:zjsb_app/widgets/my_scroll_view.dart';

class VierityCodePage extends StatefulWidget {
  // 重置类型  1 登录密码  2 交易密码
  final int type;
  // 倒计时的秒数，默认60秒。
  final int countdown;
  VierityCodePage({Key key, this.type, this.countdown = 60}) : super(key: key);

  @override
  _VierityCodePageState createState() => _VierityCodePageState();
}

class _VierityCodePageState extends State<VierityCodePage> {
  // 倒计时的计时器。
  Timer _timer;
  // 当前倒计时的秒数。
  int _seconds;
  // 当前墨水瓶（`InkWell`）的文本。
  String _verifyStr = '';

  // 按钮背景色
  Color _btnBgColor = Colours.gray_white_color;
  // 按钮字体颜色
  Color _btnTitleColor = Colours.text_color;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 开始倒计时
    _seconds = widget.countdown;
    _startTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _cancelTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _verifyStr = S.of(context).account_hqyzm;
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
          S.of(context).account_yzm,
          style: TextStyles.get2828TextStyle(context),
        ).fontSize(16), //.fontWeight(FontWeight.bold),
        centerTitle: true,
      ),
      backgroundColor: ColorUtils.getWhiteBgColor(context),
      body: MyScrollView(
        children: [
          Container(
            padding: EdgeInsets.only(left: 12, right: 12, top: 10),
            child: Text(
              S.of(context).account_yzmts,
              style: TextStyles.get6565TextStyle(context),
            ).fontSize(15),
          ),
          Gaps.vGap50,
          Container(
            height: 50,
            child: VerificationBox(
              count: 4,
              showCursor: true,
              cursorColor: Colours.gray_text_color,
              cursorWidth: 0.5,
              cursorIndent: 20,
              textStyle: TextStyle(
                  color: Colours.text_color,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              type: VerificationBoxItemType.underline,
              borderColor: Colours.gray_text_color,
              onSubmitted: (value) {
                // 获取值
              },
            ),
          ),
          Gaps.vGap50,
          Container(
            margin: EdgeInsets.only(left: 12, right: 12),
            child: MyButton(
              key: const Key('code'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResetLoginPwdPage(),
                  ),
                );
              },
              text: S.of(context).login_done,
            ),
          ),
          Gaps.vGap10,
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Row(
              children: [
                Expanded(child: SizedBox()),
                Container(
                  width: 140,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(StadiumBorder(
                        side: BorderSide(
                          color: Colors.white,
                          style: BorderStyle.none,
                        ),
                      )),
                    ),
                    child: Text(
                      _verifyStr,
                      style: TextStyle(color: _btnTitleColor, fontSize: 13),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 启动倒计时的计时器。
  void _startTimer() {
    // 计时器（`Timer`）组件的定期（`periodic`）构造函数，创建一个新的重复计时器。
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds == 0) {
        _cancelTimer();
        _seconds = widget.countdown;
        setState(() {});
        return;
      }
      _seconds--;
      _verifyStr = '$_seconds' + 'S' + S.of(context).account_cxfs;
      setState(() {});
      if (_seconds == 0) {
        _verifyStr = S.of(context).account_cxfs;
      }
    });
  }

  /// 取消倒计时的计时器。
  void _cancelTimer() {
// 计时器（`Timer`）组件的取消（`cancel`）方法，取消计时器。
    _timer?.cancel();
  }
}
