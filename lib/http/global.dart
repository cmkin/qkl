import 'package:sp_util/sp_util.dart';
import 'package:zjsb_app/common/common.dart';

/// 全局配置
class Global {
  static String token = SpUtil.getString(Constant.token);
  static String localeNumber = SpUtil.getString(Constant.localeNumber);
  static int langId = localeNumber == 'zh' ? 1 : 2;

  /// token
  static String accessToken = token;
  static bool retryEnable = true;

  /// 是否 release
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");
}
