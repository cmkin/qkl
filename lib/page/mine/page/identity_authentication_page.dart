import 'package:flutter/material.dart';
import 'package:zjsb_app/res/resources.dart';
import 'package:zjsb_app/util/color_utils.dart';
import 'package:zjsb_app/widgets/my_app_bar.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zjsb_app/widgets/my_button.dart';

class IdentityAuthenticationPage extends StatefulWidget {

  @override
  _IdentityAuthenticationPageState createState() =>
      _IdentityAuthenticationPageState();
}

class _IdentityAuthenticationPageState
    extends State<IdentityAuthenticationPage> {
  final TextEditingController controller = TextEditingController();
  final TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        centerTitle: "基础认证",
      ),
      backgroundColor: ColorUtils.getGrayWhiteBgColor(context),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text("为了您的资金安全，需验证您的身份才可以进行其他操作；认证信息一经验证不能修改，请如实填写")
                .fontSize(13)
                .textColor(Colours.dark_text_gray),
          ),
          Container(
            color: ColorUtils.getWhiteBgColor(context),
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Text("姓名").fontSize(15).textColor(ColorUtils.get2828Color(context)).fontWeight(FontWeight.w500),
                Gaps.hGap10,
                Expanded(
                  child: TextField(
                    controller: controller,
                    // 正在编辑的文本样式
                    style: TextStyle(fontSize: 14),
                    //输入框内编辑文本在水平方向的对齐方式。
                    textAlign: TextAlign.start,
                    //是否自动获取焦点。
                    autofocus: false,
                    keyboardType: TextInputType.text,
                    //是否隐藏正在编辑的文本，如用于输入密码的场景等，文本内容会用“•”替换。
                    obscureText: false,
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
                      hintText: "请输入您的真实姓名",
                      hintStyle: TextStyle(fontSize: 14,color: Colours.text_gray),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Gaps.line,
          Container(
            color: ColorUtils.getWhiteBgColor(context),
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Text("身份证号码").fontSize(15).textColor(ColorUtils.get2828Color(context)).fontWeight(FontWeight.w500),
                Gaps.hGap10,
                Expanded(
                  child: TextField(
                    controller: controller2,
                    // 正在编辑的文本样式
                    style: TextStyle(fontSize: 14),
                    //输入框内编辑文本在水平方向的对齐方式。
                    textAlign: TextAlign.start,
                    //是否自动获取焦点。
                    autofocus: false,
                    keyboardType: TextInputType.text,
                    //是否隐藏正在编辑的文本，如用于输入密码的场景等，文本内容会用“•”替换。
                    obscureText: false,
                    //如果为null，则无行数限制
                    maxLines: null,
                    //代表输入框文本的最大长度，设置后输入框右下角会显示输入的文本计数
                    maxLength: 40,
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
                      hintText: "请输入您的身份证号码",
                      hintStyle: TextStyle(fontSize: 14,color: Colours.text_gray),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Gaps.vGap32,
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: MyButton(
              onPressed: () {
                String a = controller.text;
                String b = controller2.text;
                print("${a+b}");
              },
              text: "提交",
            ),
          )
        ],
      ),
    );
  }
}
