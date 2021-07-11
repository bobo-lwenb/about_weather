import 'app_exception.dart';

/// 请求错误
class BadRequestException extends AppException {
  BadRequestException({
    required int code,
    required String message,
  }) : super(code: code, message: message);
}

/// 未认证异常
class UnauthorisedException extends AppException {
  UnauthorisedException({
    required int code,
    required String message,
  }) : super(code: code, message: message);
}
