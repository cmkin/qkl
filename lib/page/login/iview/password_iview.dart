import 'package:zjsb_app/mvp/mvps.dart';

abstract class PasswordIMvpView implements IMvpView {
  void setResponse(String entity);

  bool get isAccessibilityTest;
}
