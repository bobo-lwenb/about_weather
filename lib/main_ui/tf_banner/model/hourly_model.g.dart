// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourlyModel _$HourlyModelFromJson(Map<String, dynamic> json) {
  return HourlyModel(
    city: City.fromJson(json['city'] as Map<String, dynamic>),
    hourly: (json['hourly'] as List<dynamic>)
        .map((e) => Hourly.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$HourlyModelToJson(HourlyModel instance) =>
    <String, dynamic>{
      'city': instance.city,
      'hourly': instance.hourly,
    };
