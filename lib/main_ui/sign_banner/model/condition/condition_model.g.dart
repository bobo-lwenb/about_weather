// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'condition_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConditionModel _$ConditionModelFromJson(Map<String, dynamic> json) {
  return ConditionModel(
    city: City.fromJson(json['city'] as Map<String, dynamic>),
    condition: Condition.fromJson(json['condition'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ConditionModelToJson(ConditionModel instance) =>
    <String, dynamic>{
      'city': instance.city,
      'condition': instance.condition,
    };
