import 'package:common_utils/common_utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter/services.dart';
import 'package:sp_util/sp_util.dart';
import 'package:zjsb_app/common/common.dart';
import 'package:zjsb_app/generated/l10n.dart';
import 'package:zjsb_app/page/home/home_router.dart';
import 'package:zjsb_app/mvp/base_page.dart';
import 'package:zjsb_app/page/login/iview/login_iview.dart';
import 'package:zjsb_app/page/login/models/login_entity.dart';
import 'package:zjsb_app/page/login/models/login_request.dart';
import 'package:zjsb_app/page/login/page/password_page.dart';
import 'package:zjsb_app/page/login/page/register_page.dart';
import 'package:zjsb_app/page/login/presenter/login_presenter.dart';
import 'package:zjsb_app/page/login/widget/my_text_field.dart';
import 'package:zjsb_app/page/login/widget/title_text.dart';
import 'package:zjsb_app/res/gaps.dart';
import 'package:zjsb_app/page/routers/fluro_navigator.dart';
import 'package:zjsb_app/res/resources.dart';
import 'package:zjsb_app/util/EncryptUtil.dart';
import 'package:zjsb_app/util/change_notifier_manage.dart';
import 'package:zjsb_app/util/image_utils.dart';
import 'package:zjsb_app/util/other_utils.dart';
import 'package:zjsb_app/util/theme_utils.dart';
import 'package:zjsb_app/util/toast.dart';
import 'package:zjsb_app/widgets/my_button.dart';
import 'package:zjsb_app/widgets/my_scroll_view.dart';
import 'package:zjsb_app/widgets/webview/web_title_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with
        ChangeNotifierMixin<LoginPage>,
        BasePageMixin<LoginPage, LoginPagePresenter>
    implements LoginIMvpView {
  //定义一个controller
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  TapGestureRecognizer tapGest = TapGestureRecognizer();
  bool _clickable = false;

  @override
  Map<ChangeNotifier, List<VoidCallback>> changeNotifier() {
    final List<VoidCallback> callbacks = [_verify];
    return {
      _nameController: callbacks,
      _passwordController: callbacks,
      _nodeText1: null,
      _nodeText2: null,
    };
  }

  @override
  void initState() {
    super.initState();
    _nameController.text = SpUtil.getString(Constant.phone);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nodeText1.unfocus();
    _nodeText2.unfocus();
  }

  void _verify() {
    final String name = _nameController.text;
    final String password = _passwordController.text;
    bool clickable = true;
    if (name.isEmpty) {
      clickable = false;
    }
    if (password.isEmpty) {
      clickable = false;
    }

    /// 状态不一样在刷新，避免重复不必要的setState
    if (clickable != _clickable) {
      setState(() {
        _clickable = clickable;
      });
    }
  }

  void _login() {
    SpUtil.putString(Constant.phone, _nameController.text);
    presenter.login(LoginRequest(_nameController.text,
        EncryptUtil.encodeBase64(_passwordController.text)));
  }

  @override
  void setLoginResponse(LoginEntity loginEntity) {
    print("登录成功$loginEntity");
    NavigatorUtils.push(context, HomeRouter.homePage, replace: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      // 设置沉浸式状态栏文字颜色
      value: ThemeUtils.setNavigationBarTextColor(false),
      child: GestureDetector(
        onTap: () {
          _nodeText1.unfocus();
          _nodeText2.unfocus();
        },
        child: Scaffold(
          body: MyScrollView(
            keyboardConfig: Utils.getKeyboardActionsConfig(
                context, <FocusNode>[_nodeText1, _nodeText2]),
            children: _buildBody,
          ),
        ),
      ),
    );
  }

  List<Widget> get _buildBody => <Widget>[
        // 文字
        Container(
          margin: EdgeInsets.only(top: 80, left: 16),
          child: TitleText(
              titleStr: 'BITX ' + S.of(context).login_cloud_storage,
              subStr: S.of(context).login_welcome_login),
        ),

        Container(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
          child: Column(
            children: [
              MyTextField(
                key: const Key('username'),
                focusNode: _nodeText1,
                controller: _nameController,
                maxLength: 11,
                keyboardType: TextInputType.phone,
                hintText: S.of(context).login_please_phone_number,
              ),
              Gaps.vGap15,
              MyTextField(
                key: const Key('password'),
                keyName: 'password',
                focusNode: _nodeText2,
                isInputPwd: true,
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                maxLength: 30,
                hintText: S.of(context).login_please_login_password,
              ),
              Gaps.vGap32,
              MyButton(
                key: const Key('login'),
                onPressed: _clickable ? _login : null,
                active: _clickable,
                text: S.of(context).login_sign_in,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 230,
        ),
        Container(
          padding: EdgeInsets.only(left: 12, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    child: Text(
                      S.of(context).login_forget_pwd,
                      style: TextStyle(color: Colours.btn_bg),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return PassWordPage();
                      }));
                    },
                  ),
                  Gaps.hGap8,
                  Container(
                    height: 13,
                    width: 2,
                    color: Colours.btn_bg,
                    child: Gaps.line,
                  ),
                  Gaps.hGap8,
                  TextButton(
                    child: Text(
                      S.of(context).login_register,
                      style: TextStyle(color: Colours.btn_bg),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return RegisterPage();
                      }));
                    },
                  ),
                ],
              ),
              Gaps.vGap5,
              Text.rich(
                TextSpan(children: [
                  TextSpan(
                      text: S.of(context).login_login_agree,
                      style: TextStyle(fontSize: 12)),
                  TextSpan(
                      text: '《BITX ' + S.of(context).login_user_agreemnet + '》',
                      style: TextStyle(color: Colours.btn_bg, fontSize: 12),
                      recognizer: tapGest
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WebTitlePage(
                                  "http://www.baidu.com",
                                  '《BITX ' +
                                      S.of(context).login_user_agreemnet +
                                      '》'),
                            ),
                          );
                        }),
                ]),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ];

  @override
  LoginPagePresenter createPresenter() => LoginPagePresenter();

  @override
  bool get isAccessibilityTest => false;
}
