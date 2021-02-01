// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_time.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateTime _$UpdateTimeFromJson(Map<String, dynamic> json) {
  return UpdateTime(
    updateTime: json['updateTime'] as String,
    dataSource: json['dataSource'] as String,
  );
}

Map<String, dynamic> _$UpdateTimeToJson(UpdateTime instance) =>
    <String, dynamic>{
      'updateTime': instance.updateTime,
      'dataSource': instance.dataSource,
    };
