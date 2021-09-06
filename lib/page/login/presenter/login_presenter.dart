import 'package:flutter/material.dart' hide Router;
import 'package:sp_util/sp_util.dart';
import 'package:zjsb_app/common/common.dart';
import 'package:zjsb_app/generated/l10n.dart';
import 'package:zjsb_app/http/models/user_info.dart';
import 'package:zjsb_app/mvp/base_page_presenter.dart';
import 'package:zjsb_app/mvp/net/dio_utils.dart';
import 'package:zjsb_app/mvp/net/http_api.dart';
import 'package:zjsb_app/page/login/iview/login_iview.dart';
import 'package:zjsb_app/page/login/models/login_entity.dart';
import 'package:zjsb_app/page/login/models/login_request.dart';
import 'package:zjsb_app/http/api.dart';
import 'package:zjsb_app/util/toast.dart';

class LoginPagePresenter extends BasePagePresenter<LoginIMvpView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (view.isAccessibilityTest) {
        return;
      }

      /// 页面刚进入就请求的放这里
    });
  }

  void login(LoginRequest request) async {
    /// 接口请求例子
    /// get请求参数queryParameters  post请求参数params
    // asyncRequestNetwork<LoginEntity>(
    //   Method.post,
    //   url: HttpApi.URL_LOGIN,
    //   params: {"username": request.username, "password": request.password},
    //   onSuccess: (data) {
    //     SpUtil.putString(Constant.token, data.token);
    //     SpUtil.putString(Constant.bindId, data.bindId);
    //     SpUtil.putString(Constant.bindName, data.bindName);
    //     SpUtil.putString(Constant.projectId, data.projectId);
    //     SpUtil.putString(Constant.projectName, data.projectName);
    //     view.setLoginResponse(data);
    //   },
    // );
    Toast.loading();
    var token = await loginRec.login(request.username, request.password);
    if (token != false) {
      SpUtil.putString(Constant.token, token);

      var data = await loginRec.userInfo(token);
      SpUtil.putString(Constant.token, token);
      Toast.loading(type: 100);
      Toast.loading(type: 2, msg: S().login_succ + '!');
      view.setLoginResponse(token);
    }
  }
}
