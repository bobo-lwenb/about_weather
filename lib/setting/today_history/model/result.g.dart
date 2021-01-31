// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
    title: json['title'] as String,
    year: json['year'] as String,
    month: json['month'] as String,
    day: json['day'] as String,
    content: json['content'] as String,
  );
}

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'title': instance.title,
      'year': instance.year,
      'month': instance.month,
      'day': instance.day,
      'content': instance.content,
    };
