import 'package:zjsb_app/page/home/models/app_update_entity.dart';
import 'package:zjsb_app/mvp/mvps.dart';
import 'package:zjsb_app/page/home/models/test_entity.dart';

abstract class HomeIMvpView implements IMvpView {
  void setResponse(TestEntity entity);
  void setUpdate(AppUpdateEntity data) ;
}
