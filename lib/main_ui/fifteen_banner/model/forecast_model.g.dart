// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastModel _$ForecastModelFromJson(Map<String, dynamic> json) {
  return ForecastModel(
    city: json['city'] == null
        ? null
        : City.fromJson(json['city'] as Map<String, dynamic>),
    forecast: json['forecast'] == null
        ? null
        : Forecast.fromJson(json['forecast'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ForecastModelToJson(ForecastModel instance) =>
    <String, dynamic>{
      'city': instance.city,
      'forecast': instance.forecast,
    };