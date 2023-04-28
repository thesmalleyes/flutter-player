import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'dart:convert';

//This class will log the request and the response from API
class LoggingInterceptor extends InterceptorsWrapper {
  JsonEncoder encoder = const JsonEncoder.withIndent('  ');
  final _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      stackTraceBeginIndex: 1,
    ),
  );
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logger.i(
      'REQUEST[${options.method}] => PATH: ${options.baseUrl}${options.path} ==> HEADER: ${options.headers.entries} =>REQUEST: ${options.data is FormData ? (options.data as FormData).fields : options.data == null ? options.queryParameters : encoder.convert(options.data)}',
    );
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logger.v(
        'RESPONSE STATUS[${response.statusCode}] => PATH: ${response.requestOptions.path} => BODY: ${encoder.convert(response.data)}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    _logger.e('ERROR[${err.response}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}
