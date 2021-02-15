// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'limit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LimitModel _$LimitModelFromJson(Map<String, dynamic> json) {
  return LimitModel(
    city: json['city'] == null
        ? null
        : City.fromJson(json['city'] as Map<String, dynamic>),
    limit: (json['limit'] as List)
        ?.map(
            (e) => e == null ? null : Limit.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$LimitModelToJson(LimitModel instance) =>
    <String, dynamic>{
      'city': instance.city,
      'limit': instance.limit,
    };
