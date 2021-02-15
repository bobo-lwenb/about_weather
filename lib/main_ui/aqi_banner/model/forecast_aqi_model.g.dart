// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_aqi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastAQIModel _$ForecastAQIModelFromJson(Map<String, dynamic> json) {
  return ForecastAQIModel(
    city: json['city'] == null
        ? null
        : City.fromJson(json['city'] as Map<String, dynamic>),
    aqiForecast: json['aqiForecast'] == null
        ? null
        : ForecastAQI.fromJson(json['aqiForecast'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ForecastAQIModelToJson(ForecastAQIModel instance) =>
    <String, dynamic>{
      'city': instance.city,
      'aqiForecast': instance.aqiForecast,
    };
