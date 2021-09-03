import 'package:flutter/material.dart' hide Router;
import 'package:zjsb_app/mvp/base_page_presenter.dart';
import 'package:zjsb_app/mvp/net/dio_utils.dart';
import 'package:zjsb_app/mvp/net/http_api.dart';
import 'package:zjsb_app/page/login/iview/password_iview.dart';
import 'package:zjsb_app/util/EncryptUtil.dart';

class PasswordPagePresenter extends BasePagePresenter<PasswordIMvpView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (view.isAccessibilityTest) {
        return;
      }

      /// 页面刚进入就请求的放这里
    });
  }

  void setPassword(String old_pwd, String password, String conf_pwd) {
    asyncRequestNetwork<String>(
      Method.post,
      url: HttpApi.URL_CHANGE_PASSWORD,
      params: {
        "old_pwd": Encrypttils.base64Encode(old_pwd),
        "password": Encrypttils.base64Encode(password),
        "conf_pwd": Encrypttils.base64Encode(conf_pwd)
      },
      onSuccess: (data) {
        view.setResponse(data);
      },
    );
  }
}
