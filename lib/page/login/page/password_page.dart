import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:zjsb_app/generated/l10n.dart';
import 'package:zjsb_app/mvp/base_page.dart';
import 'package:zjsb_app/page/login/iview/password_iview.dart';
import 'package:zjsb_app/page/login/login_router.dart';
import 'package:zjsb_app/page/login/presenter/password_presenter.dart';
import 'package:zjsb_app/page/login/widget/my_text_field.dart';
import 'package:zjsb_app/page/login/widget/title_text.dart';
import 'package:zjsb_app/res/gaps.dart';
import 'package:zjsb_app/page/routers/fluro_navigator.dart';
import 'package:zjsb_app/res/resources.dart';
import 'package:zjsb_app/util/change_notifier_manage.dart';
import 'package:zjsb_app/util/color_utils.dart';
import 'package:zjsb_app/util/other_utils.dart';
import 'package:zjsb_app/widgets/my_app_bar.dart';
import 'package:zjsb_app/widgets/my_button.dart';
import 'package:zjsb_app/widgets/my_scroll_view.dart';

class PassWordPage extends StatefulWidget {
  // 1 找回密码  2 注册
  final int  viewType ;
  // 注册电话号码
  final String phone;
  const PassWordPage({
    Key key,
      this.viewType = 1,
      this.phone,
      }):super(key:key);
  @override
  _PassWordPageState createState() => _PassWordPageState();
}

class _PassWordPageState extends State<PassWordPage>
    with
        ChangeNotifierMixin<PassWordPage>,
        BasePageMixin<PassWordPage, PasswordPagePresenter>
    implements PasswordIMvpView {
  final TextEditingController _iphoneController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _newPwdController = TextEditingController();
  final TextEditingController _newPwd2Controller = TextEditingController();
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  final FocusNode _nodeText3 = FocusNode();
  final FocusNode _nodeText4 = FocusNode();
  TapGestureRecognizer tapGest = TapGestureRecognizer();
  bool _clickable = false;



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
      body: GestureDetector(
        onTap: (){
          _nodeText1.unfocus();
          _nodeText2.unfocus();
          _nodeText3.unfocus();
          _nodeText4.unfocus();
        },
        child: MyScrollView(
          keyboardConfig: Utils.getKeyboardActionsConfig(
              context, <FocusNode>[_nodeText1, _nodeText2, _nodeText3,_nodeText4]),
          children: _buildBody,
        ),
      ),
    );

  }

  List<Widget> get _buildBody => <Widget>[
       // 文字title
        Container(
          margin: EdgeInsets.only(top: 30, left: 16),
          child: TitleText(titleStr: widget.viewType == 1 ? S.of(context).login_find_pwd :  S.of(context).login_register,subStr: widget.viewType == 1 ? S.of(context).login_rule_pwd : S.of(context).register_platform_users,),
          ),
        Container(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyTextField(
                key: const Key('phone'),
                focusNode: _nodeText1,
                controller: _iphoneController,
                maxLength: widget.viewType == 1 ? 11 : 30,
                keyboardType: widget.viewType == 1 ? TextInputType.phone : TextInputType.text ,
                hintText: widget.viewType == 1 ?  S.of(context).login_please_phone_number : S.of(context).login_set_pwd,
                isInputPwd:  widget.viewType == 1 ? false : true,
              ),
              Gaps.vGap8,
              MyTextField(
                key: const Key('password'),
                keyName: 'password',
                focusNode: _nodeText2,
                isInputPwd: true,
                controller: _newPwdController,
                keyboardType: TextInputType.visiblePassword,
                maxLength: widget.viewType == 1 ? 16 : 30,
                hintText: widget.viewType == 1 ? S.of(context).login_new_pwd : S.of(context).login_transaction_pwd,
              ) ,
              Gaps.vGap8,
              MyTextField(
                key: const Key( 'password2' ),
                keyName: 'password2',
                focusNode: _nodeText3,
                isInputPwd: widget.viewType == 1 ?  true : false,
                controller: _newPwd2Controller,
                keyboardType:  TextInputType.visiblePassword ,
                maxLength: widget.viewType == 1 ? 16 : 10,
                getVCode: widget.viewType == 1 ?  null : sendCode,
                hintText: widget.viewType == 1 ? S.of(context).login_qzcsrxmm :S.of(context).login_qsrdxyzm,
              ) ,
              Gaps.vGap8,
              Text(widget.viewType == 1 ?S.of(context).login_dxyz:S.of(context).login_yqm,style: TextStyles.get6565TextStyle(context),),
              Gaps.vGap8,
              MyTextField(
                key: const Key('getVerificationCode'),
                keyName: 'getVerificationCode',
                focusNode: _nodeText4,
                controller: _codeController,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                textAlign:  widget.viewType == 1 ? TextAlign.left :  TextAlign.center,
                getVCode: widget.viewType == 1 ?  sendCode : null,
                hintText: widget.viewType == 1 ? S.of(context).login_qsrdxyzm : S.of(context).login_sryqm,
              ),
              Gaps.vGap50,
              MyButton(
                key: const Key('changPwd'),
                onPressed: _clickable ? _changePwd : null,
                text: S.of(context).login_done,
                // text: widget.viewType == 1 ? S.of(context).register_exist_account : S.of(context).login_done,
              ),
            ],
          ),
        ),
      ];

  @override
  Map<ChangeNotifier, List<VoidCallback>> changeNotifier() {
    final List<VoidCallback> callbacks = [_verify];
    return {
      _iphoneController:callbacks,
      _codeController: callbacks,
      _newPwdController: callbacks,
      _newPwd2Controller: callbacks,
      _nodeText1: null,
      _nodeText2: null,
      _nodeText3: null,
      _nodeText4: null,
    };
  }

  void _verify() {
    final String phone = _iphoneController.text;
    final String oldPwd = _codeController.text;
    final String newPwd = _newPwdController.text;
    final String newPwd2 = _newPwd2Controller.text;
    bool clickable = true;
    if (phone.isEmpty) {
      clickable = false;
    }
    if (oldPwd.isEmpty) {
      clickable = false;
    }
    if (newPwd.isEmpty) {
      clickable = false;
    }
    if (newPwd2.isEmpty) {
      clickable = false;
    }
    /// 状态不一样在刷新，避免重复不必要的setState
    if (clickable != _clickable) {
      setState(() {
        _clickable = clickable;
      });
    }
  }

  // 发送验证码
  Future<bool> sendCode() async{
    final String phone = _iphoneController.text;
    if (phone.isEmpty) {
      return false;

    }
    return false;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nodeText1.unfocus();
    _nodeText2.unfocus();
    _nodeText3.unfocus();
    _nodeText4.unfocus();
  }

  @override
  PasswordPagePresenter createPresenter() => PasswordPagePresenter();

  @override
  bool get isAccessibilityTest => false;

  @override
  void setResponse(String entity) {
    showToast("修改成功，请重新登录");
    NavigatorUtils.push(context, LoginRouter.loginPage,
        replace: true, clearStack: true);
  }

  void _changePwd() {
    presenter.setPassword(_codeController.text, _newPwdController.text,
        _newPwd2Controller.text);
  }
}
