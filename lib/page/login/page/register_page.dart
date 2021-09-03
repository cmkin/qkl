import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sp_util/sp_util.dart';
import 'package:zjsb_app/common/common.dart';
import 'package:zjsb_app/generated/l10n.dart';
import 'package:zjsb_app/page/login/page/password_page.dart';
import 'package:zjsb_app/page/login/widget/show_menus.dart';
import 'package:zjsb_app/page/login/widget/title_text.dart';
import 'package:zjsb_app/res/colors.dart';
import 'package:zjsb_app/res/gaps.dart';
import 'package:zjsb_app/util/color_utils.dart';
import 'package:zjsb_app/util/image_utils.dart';
import 'package:zjsb_app/widgets/my_app_bar.dart';
import 'package:zjsb_app/widgets/my_button.dart';

import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TapGestureRecognizer tapGest = TapGestureRecognizer();
  TextEditingController _phoneController = TextEditingController();
  FocusNode focusNode = FocusNode();
  // 电话前缀
  String prefixPhone = '+86';

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'CN';
  PhoneNumber number = PhoneNumber(isoCode: 'CN');

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'CN');

    setState(() {
      this.number = number;
    });
  }

  String getlocaleNumber() {
    String local = SpUtil.getString(Constant.locale);
    String localeNumber = SpUtil.getString(Constant.localeNumber);
    print(SpUtil.getString(Constant.locale));
    print(SpUtil.getString(Constant.localeNumber));
    return local.length != 0
        ? local
        : localeNumber.length != 0
            ? localeNumber
            : 'zh';
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colours.text_color,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(left: 16),
              alignment: Alignment.centerLeft,
              child: TitleText(
                titleStr: S.of(context).login_register,
                subStr: S.of(context).register_platform_users,
              ),
            ),
          ),
          // 间隔
          SliverPadding(padding: EdgeInsets.only(top: 80)),
          // 电话号码
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              padding: EdgeInsets.only(left: 16, right: 10),
              //height: 46,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: ColorUtils.getThemeColor().withOpacity(0.1),
                borderRadius: BorderRadius.all(Radius.circular(23)),
              ),
              child: InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber number) {
                    print(number.phoneNumber);
                  },
                  onInputValidated: (bool value) {
                    print(value);
                  },
                  selectorConfig: SelectorConfig(
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  ),
                  ignoreBlank: false,
                  autoValidateMode: AutovalidateMode.disabled,
                  selectorTextStyle: TextStyle(color: Colors.black),
                  initialValue: number,
                  textFieldController: controller,
                  formatInput: false,
                  autoFocus: true,
                  locale: getlocaleNumber(),
                  keyboardType: TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                  inputBorder: InputBorder.none,
                  onSaved: (PhoneNumber number) {
                    print('On Saved: $number');
                  },
                  hintText: S.of(context).login_please_phone_number),
            ),
          ),
          // SliverToBoxAdapter(
          //   child: Container(
          //       padding: EdgeInsets.only(left: 16, right: 16),
          //       child: Container(
          //         padding: EdgeInsets.only(left: 16, right: 10),
          //         height: 46,
          //         alignment: Alignment.center,
          //         decoration: BoxDecoration(
          //           color: ColorUtils.getThemeColor().withOpacity(0.2),
          //           borderRadius: BorderRadius.all(Radius.circular(23)),
          //         ),
          //         child: Row(
          //           children: [
          //             Gaps.hGap5,
          //             Text(prefixPhone),
          //             Gaps.hGap5,
          //             // 下拉菜单
          //             PopupMenuButton<String>(
          //               child: Image(
          //                 image: ImageUtils.getAssetImage('down'),
          //                 width: 15,
          //                 height: 15,
          //               ),
          //               // 选中
          //               onSelected: (String value) {
          //                 prefixPhone = value;
          //               },
          //               itemBuilder: (context) {
          //                 return <PopupMenuEntry<String>>[
          //                   PopupMenuItem<String>(
          //                     value: '语文',
          //                     child: Text('语文'),
          //                   ),
          //                   PopupMenuItem<String>(
          //                     value: '数学',
          //                     child: Text('数学'),
          //                   ),
          //                   PopupMenuItem<String>(
          //                     value: '英语',
          //                     child: Text('英语'),
          //                   ),
          //                   PopupMenuItem<String>(
          //                     value: '生物',
          //                     child: Text('生物'),
          //                   ),
          //                   PopupMenuItem<String>(
          //                     value: '化学',
          //                     child: Text('化学'),
          //                   ),
          //                 ];
          //               },
          //             ),
          //             Gaps.hGap10,
          //             // 输入框
          //             Expanded(
          //                 child: TextField(
          //               maxLength: 11,
          //               keyboardType: TextInputType.number,
          //               controller: _phoneController,
          //               focusNode: focusNode,
          //               decoration: InputDecoration(
          //                 hintText: S.of(context).login_please_phone_number,
          //                 counterText: '',
          //                 border: InputBorder.none,
          //               ),
          //             )),
          //           ],
          //         ),
          //       )),
          // ),
          // 间隔
          SliverPadding(padding: EdgeInsets.only(top: 80)),
          // 按钮
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: MyButton(
                key: const Key('changPwd'),
                onPressed: _changePwd,
                text: S.of(context).register_next_step,
              ),
            ),
          ),
          // 间隔
          SliverPadding(padding: EdgeInsets.only(top: 190)),
          // 立即登录
          SliverToBoxAdapter(
            child: Container(
              child: Column(
                children: [
                  TextButton(
                    child: Text(
                      S.of(context).register_exist_account,
                      style: TextStyle(color: Colours.btn_bg),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text.rich(
                    TextSpan(children: [
                      TextSpan(
                          text: S.of(context).register_zcjdbty,
                          style: TextStyle(fontSize: 12)),
                      TextSpan(
                          text: '《BITX ' +
                              S.of(context).login_user_agreemnet +
                              '》',
                          style: TextStyle(color: Colours.btn_bg, fontSize: 12),
                          recognizer: tapGest..onTap = () {}),
                    ]),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _changePwd() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PassWordPage(
        viewType: 2,
      );
    }));
  }
}
