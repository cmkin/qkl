import 'package:dio/dio.dart';
import 'package:sp_util/sp_util.dart';
import 'package:zjsb_app/common/common.dart';
import 'package:zjsb_app/util/device_utils.dart';
import 'package:zjsb_app/util/log_utils.dart';
import 'error_handle.dart';

class AuthInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final String token = SpUtil.getString(Constant.token);
    options.headers['Authorization'] = '$token';
    // options.headers['Type'] = Device.isAndroid ? "android" : "ios";
    options.headers['Model'] = '';
    return handler.next(options);
  }
}

class LoggingInterceptor extends Interceptor {
  DateTime _startTime;
  DateTime _endTime;

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _startTime = DateTime.now();
    Log.d('----------Start----------');
    if (options.queryParameters.isEmpty) {
      Log.d('RequestUrl: ' + options.baseUrl + options.path);
    } else {
      Log.d('RequestUrl: ' +
          options.baseUrl +
          options.path +
          '?' +
          Transformer.urlEncodeMap(options.queryParameters));
    }
    Log.d('RequestMethod: ' + options.method);
    Log.d('RequestHeaders:' + options.headers.toString());
    Log.d('RequestContentType: ${options.contentType}');
    Log.d('RequestData: ${options.data.toString()}');
    return handler.next(options);
  }

  @override
  onResponse(Response response,ResponseInterceptorHandler handler) {
    _endTime = DateTime.now();
    int duration = _endTime.difference(_startTime).inMilliseconds;
    if (response.statusCode == ExceptionHandle.success) {
      Log.d('ResponseCode: ${response.statusCode}');
    } else {
      Log.e('ResponseCode: ${response.statusCode}');
    }
    // 输出结果
    Log.json(response.data.toString());
    Log.d('----------End: $duration 毫秒----------');
    return handler.next(response);
  }

  @override
  onError(DioError err,ErrorInterceptorHandler handler) {
    Log.d('----------Error-----------');
    return handler.next(err);
  }
}
