// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_aqi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastAQIModel _$ForecastAQIModelFromJson(Map<String, dynamic> json) {
  return ForecastAQIModel(
    city: City.fromJson(json['city'] as Map<String, dynamic>),
    aqiForecast: (json['aqiForecast'] as List<dynamic>)
        .map((e) => ForecastAQI.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ForecastAQIModelToJson(ForecastAQIModel instance) =>
    <String, dynamic>{
      'city': instance.city,
      'aqiForecast': instance.aqiForecast,
    };
