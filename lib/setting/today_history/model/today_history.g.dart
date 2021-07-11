// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodayHistory _$TodayHistoryFromJson(Map<String, dynamic> json) {
  return TodayHistory(
    status: json['status'] as int?,
    msg: json['msg'] as String?,
    result: (json['result'] as List<dynamic>?)
        ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$TodayHistoryToJson(TodayHistory instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'result': instance.result,
    };
