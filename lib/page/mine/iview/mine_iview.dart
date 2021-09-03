import 'package:zjsb_app/page/home/models/app_update_entity.dart';
import 'package:zjsb_app/page/home/models/mine_entity.dart';
import 'package:zjsb_app/mvp/mvps.dart';

abstract class MineIMvpView implements IMvpView {
  void setResponse(MineEntity entity);
  void setUpdate(AppUpdateEntity entity);
  void setVersion(String version);

  bool get isAccessibilityTest;
}
