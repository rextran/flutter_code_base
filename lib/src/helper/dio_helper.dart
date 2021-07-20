import 'dart:async';

import 'package:dio/dio.dart';
import '../log/logger.dart';

class CustomInterceptors extends Interceptor {
  // Stream to send data outside
  final StreamController<RequestOptions> _requestStream =
      StreamController.broadcast();
  Stream get onRequestStream => _requestStream.stream;

  final StreamController<Response> _responseStream =
      StreamController.broadcast();
  Stream get onResponseStream => _responseStream.stream;

  final StreamController<DioError> _errorStream = StreamController.broadcast();
  Stream get onErrorStream => _errorStream.stream;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logi.d('REQUEST[${options.method}] => PATH: ${options.path}');
    _requestStream.add(options);
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logi.d(
        'RESPONSE[${response.statusCode}] => PATH: ${response.realUri.path}');
    _responseStream.add(response);
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    logi.e(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.response?.realUri.path}');
    _errorStream.add(err);
    return super.onError(err, handler);
  }
}
