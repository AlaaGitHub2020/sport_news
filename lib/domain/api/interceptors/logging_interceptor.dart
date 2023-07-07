import 'package:dio/dio.dart';
import 'package:sport_news/domain/core/utilities/logger/simple_log_printer.dart';

class LoggingInterceptor extends Interceptor {
  final log = getLogger();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log.d(
        'REQUEST[${options.method}] => PATH: ${options.path} URI: ${options.uri}  HEADERS: ${options.headers} BODY: ${options.data}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log.d(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path} REAL_URI: ${response.realUri}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log.e(
        'ERROR_CODE[${err.response?.statusCode}] ERROR: ${err.error} => PATH: ${err.requestOptions.path} ERROR_MESSAGE: ${err.message}');
    super.onError(err, handler);
  }
}
