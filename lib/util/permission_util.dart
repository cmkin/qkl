import 'package:permission_handler/permission_handler.dart';
import 'package:zjsb_app/util/toast.dart';

enum TKPermission {
  camera, // 相机
  photos, // 相册
  microphone, // 麦克风
  storage, //  存储
}

class ConstConfig {
  // 请求权限
  static Future<bool> perssionRequest(TKPermission type) async {
    String typeName = '';
    Permission permissionType = Permission.unknown;
    switch (type) {
      case TKPermission.camera:
        //获取相机权限
        typeName = '相机';
        permissionType = Permission.camera;
        break;
      case TKPermission.photos:
        //获取相册权限
        typeName = '相册';
        permissionType = Permission.photos;
        break;
      case TKPermission.microphone:
        //获取麦克风权限
        typeName = '麦克风';
        permissionType = Permission.microphone;
        break;
      case TKPermission.storage:
        //获取存储
        typeName = '存储';
        permissionType = Permission.storage;
        break;
      default:
    }
    //获取当前的权限
    var status = await permissionType.status;
    if (status == PermissionStatus.granted) {
      //已经授权
      return true;
    } else {
      //未授权则发起一次申请
      status = await permissionType.request();
      if (status == PermissionStatus.granted) {
        return true;
      } else {
        Toast.show('请前往设置->在APP中开启 $typeName 权限');
        return false;
      }
    }
  }

  /// 动态申请定位权限
  static void requestPermission() async {
    // 申请权限
    bool hasLocationPermission = await requestLocationPermission();
    if (hasLocationPermission) {
      print("定位权限申请通过");
    } else {
      print("定位权限申请不通过");
    }
  }

  // 申请定位权限
  static Future<bool> requestLocationPermission() async {
    //获取当前的权限
    var status = await Permission.location.status;
    if (status == PermissionStatus.granted) {
      //已经授权
      return true;
    } else {
      //未授权则发起一次申请
      status = await Permission.location.request();
      if (status == PermissionStatus.granted) {
        return true;
      } else {
        Toast.show('请前往设置->在APP中开启 定位 权限');
        return false;
      }
    }
  }
}
