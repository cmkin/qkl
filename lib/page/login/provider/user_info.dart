import 'package:flutter/material.dart';
import 'package:sp_util/sp_util.dart';
import 'package:zjsb_app/common/common.dart';

import 'package:zjsb_app/http/models/user_info.dart';
import 'package:zjsb_app/http/api.dart';

class UserInfoPrivider extends ChangeNotifier {
  Data userInfo;

  updateUserInfo(token) async {
    Data data =
        await loginRec.userInfo(token ?? SpUtil.getString(Constant.token));
    userInfo = data;
    notifyListeners();
  }
}
