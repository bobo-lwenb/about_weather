// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sfc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SFC _$SFCFromJson(Map<String, dynamic> json) {
  return SFC(
    banner: json['banner'] as String,
    confirmInfo: json['confirmInfo'] == null
        ? null
        : ConfirmInfo.fromJson(json['confirmInfo'] as Map<String, dynamic>),
    isCorrect: json['isCorrect'] as int,
    isFeedback: json['isFeedback'] as int,
    notice: json['notice'] as String,
    percent: (json['percent'] as List)
        ?.map((e) =>
            e == null ? null : Percent.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    rain: json['rain'] as int,
    rainLastTime: json['rainLastTime'] as int,
    sfCondition: json['sfCondition'] as int,
    timestamp: json['timestamp'] as int,
  );
}

Map<String, dynamic> _$SFCToJson(SFC instance) => <String, dynamic>{
      'banner': instance.banner,
      'confirmInfo': instance.confirmInfo,
      'isCorrect': instance.isCorrect,
      'isFeedback': instance.isFeedback,
      'notice': instance.notice,
      'percent': instance.percent,
      'rain': instance.rain,
      'rainLastTime': instance.rainLastTime,
      'sfCondition': instance.sfCondition,
      'timestamp': instance.timestamp,
    };
