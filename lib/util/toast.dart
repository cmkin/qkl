import 'package:oktoast/oktoast.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

/// Toast工具类
class Toast {
  ////oktoast
  static void show(String msg, {int duration = 3000}) {
    if (msg == null) {
      return;
    }
    showToast(msg,
        duration: Duration(milliseconds: duration), dismissOtherToast: true);
  }

  static void cancelToast() {
    dismissAllToast();
  }

/////flutter_easyloading

  static void loading({String msg, int type = 1}) {
    switch (type) {
      case 100: //移除
        EasyLoading.dismiss();
        break;
      case 1:
        EasyLoading.show(status: msg ?? '加载中...');
        break;
      case 2:
        EasyLoading.showSuccess(msg ?? '操作成功!');
        break;
    }

    //https://github.com/nslog11/flutter_easyloading/blob/master/README-zh_CN.md

    // EasyLoading.show(status: 'loading...');

    // EasyLoading.showProgress(0.3, status: 'downloading...');

    // EasyLoading.showSuccess('Great Success!');

    // EasyLoading.showError('Failed with Error');

    // EasyLoading.showInfo('Useful Information.');

    // EasyLoading.showToast('Toast');

    // EasyLoading.dismiss();
  }
}
