// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodayHistory _$TodayHistoryFromJson(Map<String, dynamic> json) {
  return TodayHistory(
    resCode: json['showapi_res_code'] as int,
    resError: json['showapi_res_error'] as String,
    resBody: ResBody.fromJson(json['showapi_res_body'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TodayHistoryToJson(TodayHistory instance) =>
    <String, dynamic>{
      'showapi_res_code': instance.resCode,
      'showapi_res_error': instance.resError,
      'showapi_res_body': instance.resBody,
    };
