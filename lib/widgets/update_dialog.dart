import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:zjsb_app/page/home/models/app_update_entity.dart';
import 'package:zjsb_app/res/colors.dart';
import 'package:zjsb_app/res/dimens.dart';
import 'package:zjsb_app/res/gaps.dart';
import 'package:zjsb_app/res/styles.dart';
import 'package:zjsb_app/page/routers/fluro_navigator.dart';
import 'package:zjsb_app/util/image_utils.dart';
import 'package:zjsb_app/util/theme_utils.dart';
import 'package:zjsb_app/util/toast.dart';
import 'package:zjsb_app/util/native_utils.dart';

class UpdateDialog extends StatefulWidget {
  AppUpdateData data;
  bool isForce = false;

  UpdateDialog(this.data) {
    //1强制
    if (data.force == 1) {
      this.isForce = true;
    } else {
      this.isForce = false;
    }
  }

  @override
  _UpdateDialogState createState() => _UpdateDialogState();
}

class _UpdateDialogState extends State<UpdateDialog> {
  final CancelToken _cancelToken = CancelToken();
  bool _isDownload = false;
  double _value = 0;

  @override
  void dispose() {
    if (!_cancelToken.isCancelled && _value != 1) {
      _cancelToken.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    return WillPopScope(
      onWillPop: () async {
        /// 使用false禁止返回键返回，达到强制升级目的
        return false;
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 120.0,
                  width: 280.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0)),
                    image: DecorationImage(
                      image: ImageUtils.getAssetImage('update_head',
                          format: ImageFormat.jpg),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: 280.0,
                  decoration: BoxDecoration(
                      color: ThemeUtils.getDialogBackgroundColor(context),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0))),
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('新版本${widget.data.version}更新',
                          style: TextStyles.textSize16),
                      Gaps.vGap10,
                      Text('${widget.data.releaseNotes}'),
                      Gaps.vGap15,
                      _isDownload
                          ? LinearProgressIndicator(
                              backgroundColor: Colours.line,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(primaryColor),
                              value: _value,
                            )
                          : _buildButton(context),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget _buildButton(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: 110.0,
          height: 36.0,
          child: widget.isForce
              ? Gaps.empty
              : FlatButton(
                  onPressed: () {
                    NavigatorUtils.goBack(context);
                  },
                  textColor: primaryColor,
                  color: Colors.transparent,
                  disabledTextColor: Colors.white,
                  disabledColor: Colours.text_gray_c,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(
                      color: primaryColor,
                      width: 0.8,
                    ),
                  ),
                  child: Text(
                    '残忍拒绝',
                    style: TextStyle(fontSize: Dimens.font_sp16),
                  ),
                ),
        ),
        Container(
          width: 110.0,
          height: 36.0,
          child: FlatButton(
            onPressed: () {
              if (defaultTargetPlatform == TargetPlatform.iOS) {
                NavigatorUtils.goBack(context);
                NativeUtils.jumpAppStore();
              } else {
                setState(() {
                  _isDownload = true;
                });
                _download();
              }
            },
            textColor: Colors.white,
            color: primaryColor,
            disabledTextColor: Colors.white,
            disabledColor: Colours.text_gray_c,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Text(
              '立即更新',
              style: TextStyle(fontSize: Dimens.font_sp16),
            ),
          ),
        )
      ],
    );
  }

  ///下载apk
  Future<void> _download() async {
    try {
      setInitDir(initStorageDir: true);
      await DirectoryUtil.getInstance();
      DirectoryUtil.createStorageDirSync(category: 'Download');
      String path = DirectoryUtil.getStoragePath(
          fileName: 'flutter_test', category: 'Download', format: 'apk');
      File file = File(path);

      /// 链接可能会失效
      await Dio().download(
        '${widget.data.address}',
        file.path,
        cancelToken: _cancelToken,
        onReceiveProgress: (int count, int total) {
          if (total != -1) {
            _value = count / total;
            setState(() {});
            if (count == total) {
              NavigatorUtils.goBack(context);
              NativeUtils.install(path);
            }
          }
        },
      );
    } catch (e) {
      Toast.show('下载失败!');
      print(e);
      setState(() {
        _isDownload = false;
      });
    }
  }
}
