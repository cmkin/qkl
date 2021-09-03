import 'package:zjsb_app/mvp/mvps.dart';
import 'package:zjsb_app/page/login/models/login_entity.dart';

abstract class LoginIMvpView implements IMvpView {
  void setLoginResponse(LoginEntity loginEntity);

  bool get isAccessibilityTest;
}
