// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'condition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Condition _$ConditionFromJson(Map<String, dynamic> json) {
  return Condition(
    condition: json['condition'] as String,
    conditionId: json['conditionId'] as String,
    humidity: json['humidity'] as String,
    icon: json['icon'] as String,
    pressure: json['pressure'] as String,
    realFeel: json['realFeel'] as String,
    sunRise: json['sunRise'] as String,
    sunSet: json['sunSet'] as String,
    temp: json['temp'] as String,
    tips: json['tips'] as String,
    updatetime: json['updatetime'] as String,
    uvi: json['uvi'] as String,
    vis: json['vis'] as String,
    windDegrees: json['windDegrees'] as String,
    windDir: json['windDir'] as String,
    windLevel: json['windLevel'] as String,
    windSpeed: json['windSpeed'] as String,
  );
}

Map<String, dynamic> _$ConditionToJson(Condition instance) => <String, dynamic>{
      'condition': instance.condition,
      'conditionId': instance.conditionId,
      'humidity': instance.humidity,
      'icon': instance.icon,
      'pressure': instance.pressure,
      'realFeel': instance.realFeel,
      'sunRise': instance.sunRise,
      'sunSet': instance.sunSet,
      'temp': instance.temp,
      'tips': instance.tips,
      'updatetime': instance.updatetime,
      'uvi': instance.uvi,
      'vis': instance.vis,
      'windDegrees': instance.windDegrees,
      'windDir': instance.windDir,
      'windLevel': instance.windLevel,
      'windSpeed': instance.windSpeed,
    };
