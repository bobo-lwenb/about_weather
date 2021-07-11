// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aqi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AQIModel _$AQIModelFromJson(Map<String, dynamic> json) {
  return AQIModel(
    aqi: AQIIndex.fromJson(json['aqi'] as Map<String, dynamic>),
    city: City.fromJson(json['city'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AQIModelToJson(AQIModel instance) => <String, dynamic>{
      'aqi': instance.aqi,
      'city': instance.city,
    };
