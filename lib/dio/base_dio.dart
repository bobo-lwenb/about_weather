import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import 'interceptor/error_interceptor.dart';

class BaseDio {
  late Dio _dio;
  String baseUrl;
  String appCode;

  BaseDio({
    required this.baseUrl,
    required this.appCode,
  }) {
    _init();
  }

  BaseDio _init() {
    BaseOptions baseOptions = BaseOptions();
    baseOptions.baseUrl = baseUrl;
    baseOptions.connectTimeout = 15000;
    baseOptions.receiveTimeout = 15000;
    baseOptions.headers = {
      HttpHeaders.contentTypeHeader:
          "application/x-www-form-urlencoded; charset=UTF-8"
    };
    if (appCode.isNotEmpty) {
      baseOptions.headers[HttpHeaders.authorizationHeader] = "APPCODE $appCode";
    }
    baseOptions.responseType = ResponseType.json;
    _dio = Dio(baseOptions);
    _dio.interceptors.add(ErrorInterceptor());
    dioSetting(_dio);
    return this;
  }

  void dioSetting(Dio dio) {}

  Future<Map<String, dynamic>> get({
    required String path,
    Map<String, dynamic>? queryParams,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    Response response = await _dio.get(
      path,
      queryParameters: queryParams,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
    return response.data is Map<String, dynamic>
        ? response.data
        : json.decode(response.data);
  }

  Future<Map<String, dynamic>> post({
    required String path,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    Response response = await _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response.data is Map<String, dynamic>
        ? response.data
        : json.decode(response.data);
  }
}
