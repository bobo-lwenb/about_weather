import 'package:dio/dio.dart';

import 'exceptions.dart';

class AppException implements Exception {
  final String message;
  final int code;

  AppException({
    required this.code,
    required this.message,
  });

  factory AppException.create(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        return BadRequestException(code: -1, message: "请求取消");
      case DioErrorType.connectTimeout:
        return BadRequestException(code: -1, message: "连接超时");
      case DioErrorType.sendTimeout:
        return BadRequestException(code: -1, message: "请求超时");
      case DioErrorType.receiveTimeout:
        return BadRequestException(code: -1, message: "响应超时");
      case DioErrorType.response:
        try {
          int errCode = error.response!.statusCode!;
          String errMsg = error.response!.statusMessage!;
          print("==============$errMsg");
          // return ErrorEntity(code: errCode, message: errMsg);
          switch (errCode) {
            case 400:
              return BadRequestException(code: errCode, message: "请求语法错误");
            case 401:
              return UnauthorisedException(code: errCode, message: "没有权限");
            case 403:
              return UnauthorisedException(code: errCode, message: "服务器拒绝执行");
            case 404:
              return UnauthorisedException(code: errCode, message: "无法连接服务器");
            case 405:
              return UnauthorisedException(code: errCode, message: "请求方法被禁止");
            case 500:
              return UnauthorisedException(code: errCode, message: "服务器内部错误");
            case 502:
              return UnauthorisedException(code: errCode, message: "无效的请求");
            case 503:
              return UnauthorisedException(code: errCode, message: "服务器挂了");
            case 505:
              return UnauthorisedException(
                  code: errCode, message: "不支持HTTP协议请求");
            default:
              // return ErrorEntity(code: errCode, message: "未知错误");
              return AppException(
                  code: errCode, message: error.response!.statusMessage!);
          }
        } on Exception catch (_) {
          return AppException(code: -1, message: "未知错误");
        }
      default:
        return AppException(code: -1, message: error.message);
    }
  }

  String toString() {
    return "$code $message";
  }
}
