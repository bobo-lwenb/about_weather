// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastModel _$ForecastModelFromJson(Map<String, dynamic> json) {
  return ForecastModel(
    city: City.fromJson(json['city'] as Map<String, dynamic>),
    forecast: (json['forecast'] as List<dynamic>)
        .map((e) => Forecast.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ForecastModelToJson(ForecastModel instance) =>
    <String, dynamic>{
      'city': instance.city,
      'forecast': instance.forecast,
    };
