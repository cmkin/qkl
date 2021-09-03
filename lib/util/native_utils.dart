import 'package:flustars/flustars.dart';
import 'package:flutter/services.dart';
import 'package:zjsb_app/common/common.dart';
import 'package:zjsb_app/util/device_utils.dart';
import 'package:zjsb_app/util/permission_util.dart';

class NativeUtils {
  static const methodChannelKey = "nativeMethod";
  static const MethodChannel _kChannel = MethodChannel(methodChannelKey);
  static final String TAG = "nativeMethod Error";

  static MethodChannel getChannel() {
    return _kChannel;
  }

  /// 应用安装
  static void install(String path) {
    try {
      _kChannel.invokeMethod('install', {'path': path});
    } catch (e) {
      print(TAG + e.toString());
    }
  }

  /// AppStore跳转
  static void jumpAppStore() {
    try {
      _kChannel.invokeMethod('jumpAppStore');
    } catch (e) {
      print(TAG + e.toString());
    }
  }

  // 移除原生页面扫描和人脸存储的图片
  static void removeNativeImage(Map map) {
    try {
      if (Device.isIOS) {
        _kChannel.invokeMethod('removeNativeImage', {'map': map});
      }
    } catch (e) {
      print(TAG + e.toString());
    }
  }

  //扫人脸
  static Future<Map> scanFace() async {
    final isCamera = await ConstConfig.perssionRequest(TKPermission.camera);
    final isStorage = await ConstConfig.perssionRequest(TKPermission.storage);
    if (isCamera && isStorage) {
      // 获取本地的用户信息
      Map userInfo = Map();
      // 地址前缀
      userInfo['baseUrl'] = Constant.baseUrl;
      // 绑定信息Id
      userInfo[Constant.bindId] = SpUtil.getString(Constant.bindId);
      // 项目id
      userInfo[Constant.projectId] = SpUtil.getString(Constant.projectId);
      try {
        _kChannel
            .invokeMethod('scanFace', {'userInfo': userInfo});
      } catch (e) {
        print(TAG + e.toString());
      }
    }
  }
}
