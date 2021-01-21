// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) {
  return Event(
    title: json['title'] as String,
    img: json['img'] as String,
    year: json['year'] as String,
    month: json['month'] as int,
    day: json['day'] as int,
  );
}

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'title': instance.title,
      'img': instance.img,
      'year': instance.year,
      'month': instance.month,
      'day': instance.day,
    };
