import 'package:about_weather/dio/exception/app_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    AppException appException = AppException.create(err);
    debugPrint("DioError===: ${appException.toString()}");
    err.error = appException;
    super.onError(err, handler);
  }
}
