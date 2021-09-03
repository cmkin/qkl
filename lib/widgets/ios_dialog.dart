import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:zjsb_app/generated/l10n.dart';
import 'package:zjsb_app/res/colors.dart';
import 'package:zjsb_app/res/gaps.dart';
import 'package:zjsb_app/util/color_utils.dart';

class IosDialog extends StatefulWidget {
  const IosDialog({
    Key key,
    this.title = '提示',
    this.leftText = "取消",
    this.rightText = "确认",
    this.cancelBack = true,
    this.isShowInput = false,
    this.leftColor = Colours.text,
    @required this.message,
    @required this.onLeftPressed,
    @required this.onRightPressed,
    this.controller,
  }) : super(key: key);

  final bool cancelBack;
  final bool isShowInput;
  final String title;
  final String leftText;
  final String rightText;
  final String message;
  final Color leftColor;
  final VoidCallback onLeftPressed;
  final VoidCallback onRightPressed;
  final TextEditingController controller;

  @override
  _IosDialogState createState() => _IosDialogState();
}

class _IosDialogState extends State<IosDialog> {
  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    return WillPopScope(
      onWillPop: () async {
        /// 使用false禁止返回键返回，达到强制升级目的
        return widget.cancelBack;
      },
      child: Scaffold(
        // 布局随键盘顶起来
        resizeToAvoidBottomInset: widget.isShowInput ? true : false,
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            width: 280,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    padding: EdgeInsets.only(
                        top: 10, left: 10, right: 10, bottom: 20),
                    decoration: BoxDecoration(
                        color: ColorUtils.getWhiteBgColor(context),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15))),
                    child: Column(
                      children: [
                        Center(
                            child: Text(
                          widget.title == "提示"?"${S.of(context).dialog_title}":widget.title,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colours.text,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                        Gaps.vGap10,
                        Center(
                            child: Text(
                          widget.message,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colours.text,
                          ),
                        )),
                        widget.isShowInput?Gaps.vGap24:Gaps.vGap15,
                        widget.isShowInput
                            ? Container(
                                height: 40,
                                padding:
                                    EdgeInsets.only(left: 5, right: 5, top: 5),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 0.5,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8.0)),
                                ),
                                child: TextField(
                                  controller: widget.controller,
                                  // 正在编辑的文本样式
                                  style: TextStyle(fontSize: 14),
                                  //输入框内编辑文本在水平方向的对齐方式。
                                  textAlign: TextAlign.start,
                                  //是否自动获取焦点。
                                  autofocus: false,
                                  keyboardType: TextInputType.text,
                                  //是否隐藏正在编辑的文本，如用于输入密码的场景等，文本内容会用“•”替换。
                                  obscureText: true,
                                  //如果为null，则无行数限制
                                  maxLines: 1,
                                  //代表输入框文本的最大长度，设置后输入框右下角会显示输入的文本计数
                                  maxLength: 6,
                                  //决定当输入文本长度超过maxLength时是否阻止输入，为true时会阻止输入，为false时不会阻止输入但输入框会变红。
                                  maxLengthEnforced: true,
                                  //光标颜色
                                  cursorColor: Colors.blue,
                                  //输入监听
                                  onChanged: (text) {},
                                  //输入框样式
                                  decoration: InputDecoration(
                                    counterText: '',
                                    // 去除输入框底部的字符计数
                                    // 未获得焦点下划线设为灰色
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    // //获得焦点下划线设为蓝色
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    hintText: "${S.of(context).dialog_hint}",
                                    hintStyle: TextStyle(fontSize: 13),
                                  ),
                                ),
                              )
                            : Gaps.empty,
                      ],
                    )),
                Container(
                  color: Colours.line,
                  height: 0.4,
                ),
                Row(
                  // direction: Axis.horizontal,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Ink(
                        decoration: BoxDecoration(
                            //渐变
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Colors.white, Colors.white]),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15))),
                        child: InkWell(
                          splashColor: Colours.click_color,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15)),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Center(
                              child: Text(
                                  widget.leftText == "取消"?"${S.of(context).dialog_cancel}":widget.leftText,
                                style: TextStyle(
                                    color: widget.leftColor, fontSize: 18),
                              ),
                            ),
                          ),
                          onTap: widget.onLeftPressed,
                        ),
                      ),
                    ),
                    Container(
                      color: Colours.line,
                      width: 0.2,
                    ),
                    Expanded(
                      flex: 1,
                      child: Ink(
                        decoration: BoxDecoration(
                            //渐变
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Colors.white, Colors.white]),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(15))),
                        child: InkWell(
                          splashColor: Colours.click_color,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15)),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Center(
                              child: Text(
                                widget.rightText == "确认"?"${S.of(context).dialog_confirm}":widget.rightText,
                                style: TextStyle(
                                    color: primaryColor, fontSize: 18),
                              ),
                            ),
                          ),
                          onTap: widget.onRightPressed,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onPressed() {}
}
