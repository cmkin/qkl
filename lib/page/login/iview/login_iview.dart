import 'package:zjsb_app/mvp/mvps.dart';
import 'package:zjsb_app/page/login/models/login_entity.dart';
import 'package:zjsb_app/http/models/user_info.dart';

abstract class LoginIMvpView implements IMvpView {
  void setLoginResponse(loginEntity);

  bool get isAccessibilityTest;
}
