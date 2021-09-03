import 'dart:io';

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:zjsb_app/common/common.dart';
import 'package:zjsb_app/mvp/net/dio_utils.dart';
import 'package:zjsb_app/mvp/net/http_api.dart';
import 'package:zjsb_app/page/login/login_router.dart';
import 'package:zjsb_app/page/routers/fluro_navigator.dart';

import 'base_presenter.dart';
import 'mvps.dart';

class BasePagePresenter<V extends IMvpView> extends BasePresenter<V> {
  CancelToken _cancelToken;

  BasePagePresenter() {
    _cancelToken = CancelToken();
  }

  @override
  void dispose() {
    /// 销毁时，将请求取消
    if (!_cancelToken.isCancelled) {
      _cancelToken.cancel();
    }
  }

  /// 返回Future 适用于刷新，加载更多
  Future requestNetwork<T>(
    Method method, {
    @required String url,
    bool isShow = true,
    bool isClose = true,
    NetSuccessCallback<T> onSuccess,
    NetErrorCallback onError,
    dynamic params,
    Map<String, dynamic> queryParameters,
    CancelToken cancelToken,
    Options options,
  }) {
    if (isShow) view.showProgress();
    return DioUtils.instance.requestNetwork<T>(
      method,
      url,
      params: params,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken ?? _cancelToken,
      onSuccess: (data) {
        if (isClose) view.closeProgress();
        if (onSuccess != null) {
          onSuccess(data);
        }
      },
      onError: (code, msg) {
        _onError(code, msg, onError);
      },
    );
  }

  void asyncRequestNetwork<T>(
    Method method, {
    @required String url,
    bool isShow = true,
    bool isClose = true,
    NetSuccessCallback<T> onSuccess,
    NetErrorCallback onError,
    dynamic params,
    Map<String, dynamic> queryParameters,
    CancelToken cancelToken,
    Options options,
  }) {
    if (isShow) view.showProgress();
    DioUtils.instance.asyncRequestNetwork<T>(
      method,
      url,
      params: params,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken ?? _cancelToken,
      onSuccess: (data) {
        if (isClose) view.closeProgress();
        if (onSuccess != null) {
          onSuccess(data);
        }
      },
      onError: (code, msg) {
        _onError(code, msg, onError);
      },
    );
  }

  /// 上传图片实现
  Future<String> uploadImg(String patha) async {
    String imgPath = '';
    try {
      final String path = patha;
      final String name = path.substring(path.lastIndexOf('/') + 1);
      final FormData formData = FormData.fromMap(
          {'file': await MultipartFile.fromFile(path, filename: name)});
      await requestNetwork<String>(Method.post,
          url: HttpApi.URL_RECORD_UPLOAD, params: formData, onSuccess: (data) {
        imgPath = data;
      });
    } catch (e) {
      view.showToast('图片上传失败！');
    }
    return imgPath;
  }

  /// 上传多张图片实现
  uploadImgList<T>({
    bool isShow = true,
    bool isClose = true,
    NetSuccessCallback<T> onSuccess,
    NetErrorCallback onError,
    List<String> imgList,
    Map<String, dynamic> queryParameters,
    CancelToken cancelToken,
    Options options,
  }) {
    var formData = FormData();
    imgList.forEach((path) {
      formData.files.add(MapEntry(
        "file",
        MultipartFile.fromFileSync(path,
            filename: path.substring(path.lastIndexOf('/') + 1)),
      ));
    });
    if (isShow) view.showProgress();
    DioUtils.instance.asyncRequestNetwork<T>(
      Method.post,
      HttpApi.URL_RECORD_UPLOAD,
      params: formData,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken ?? _cancelToken,
      onSuccess: (data) {
        if (isClose) view.closeProgress();
        if (onSuccess != null) {
          onSuccess(data);
        }
      },
      onError: (code, msg) {
        _onError(code, msg, onError);
      },
    );
  }

  void _onError(int code, String msg, NetErrorCallback onError) {
    /// 异常时直接关闭加载圈，不受isClose影响
    view.closeProgress();
    view.showToast(msg);

    if (code == Constant.reLoginCode && view.getContext() != null) {
      ///token失效，跳转登录页
      NavigatorUtils.push(view.getContext(), LoginRouter.loginPage,
          replace: true, clearStack: true);
    }

    /// 页面如果dispose，则不回调onError
    if (onError != null && view.getContext() != null) {
      onError(code, msg);
    }
  }
}
