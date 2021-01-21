import 'package:about_weather/dio/exception/app_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ErrorInterceptor extends Interceptor {
  @override
  Future onError(DioError err) {
    AppException appException = AppException.create(err);
    debugPrint("DioError===: ${appException.toString()}");
    err.error = appException;
    return super.onError(err);
  }
}
