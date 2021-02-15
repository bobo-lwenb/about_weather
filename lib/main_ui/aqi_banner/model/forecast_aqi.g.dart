// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_aqi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastAQI _$ForecastAQIFromJson(Map<String, dynamic> json) {
  return ForecastAQI(
    date: json['date'] as String,
    publishTime: json['publishTime'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$ForecastAQIToJson(ForecastAQI instance) =>
    <String, dynamic>{
      'date': instance.date,
      'publishTime': instance.publishTime,
      'value': instance.value,
    };
