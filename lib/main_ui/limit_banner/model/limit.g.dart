// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'limit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Limit _$LimitFromJson(Map<String, dynamic> json) {
  return Limit(
    date: json['date'] as String,
    prompt: json['prompt'] as String,
  );
}

Map<String, dynamic> _$LimitToJson(Limit instance) => <String, dynamic>{
      'date': instance.date,
      'prompt': instance.prompt,
    };
