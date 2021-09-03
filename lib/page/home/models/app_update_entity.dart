import 'package:zjsb_app/generated/json/base/json_convert_content.dart';

class AppUpdateEntity with JsonConvert<AppUpdateEntity> {
  String msg;
  String code;
  AppUpdateRetdata retdata;
  AppUpdateData data;
}

class AppUpdateRetdata with JsonConvert<AppUpdateRetdata> {
  bool update;
  String address;
  String releaseNotes;
  String version;
  int force;
}

class AppUpdateData with JsonConvert<AppUpdateData> {
  bool update;
  String address;
  String releaseNotes;
  String version;
  int force;
}
