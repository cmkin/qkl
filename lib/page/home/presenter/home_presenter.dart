import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:package_info/package_info.dart';
import 'package:zjsb_app/generated/json/base/json_convert_content.dart';
import 'package:zjsb_app/page/home/iview/home_iview.dart';
import 'package:zjsb_app/page/home/models/app_update_entity.dart';
import 'package:zjsb_app/page/home/models/mine_entity.dart';
import 'package:zjsb_app/mvp/base_page_presenter.dart';
import 'package:zjsb_app/mvp/net/dio_utils.dart';
import 'package:zjsb_app/mvp/net/http_api.dart';
import 'package:zjsb_app/util/device_utils.dart';
import 'package:zjsb_app/util/native_utils.dart';

class HomePresenter extends BasePagePresenter<HomeIMvpView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      /// 页面刚进入就请求的放这里
    });
  }

  void getDeviceList(type) {
    asyncRequestNetwork<MineEntity>(
      Method.get,
      url: '${HttpApi.productList}?groupId=1&langId=1',
      onSuccess: (data) {
        // print(data);
        // view.setResponse(data);
      },
    );
  }

  void goScanNative(String type) {
    NativeUtils.scanFace();
  }

  void getAppUpdate() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    Response response = await Dio().post(HttpApi.APP_UPDATE_URL, data: {
      "version": version,
      "system": Device.isAndroid ? "2" : "1",
      "appId": "lhzjsb",
    });
    print(response);
    Map map = json.decode(response.data.toString()) as Map<String, dynamic>;
    AppUpdateEntity data = JsonConvert.fromJsonAsT<AppUpdateEntity>(map);
    view.setUpdate(data);
  }
}
