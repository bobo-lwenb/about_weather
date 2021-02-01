// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trend_detailed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrendDetailed _$TrendDetailedFromJson(Map<String, dynamic> json) {
  return TrendDetailed(
    day: json['day'] as String,
    sureCnt: json['sure_cnt'] as int,
    dieCnt: json['die_cnt'] as int,
    cureCnt: json['cure_cnt'] as int,
    doubtCnt: json['doubt_cnt'] as int,
    fullDay: json['fullDay'] as int,
  );
}

Map<String, dynamic> _$TrendDetailedToJson(TrendDetailed instance) =>
    <String, dynamic>{
      'day': instance.day,
      'sure_cnt': instance.sureCnt,
      'die_cnt': instance.dieCnt,
      'cure_cnt': instance.cureCnt,
      'doubt_cnt': instance.doubtCnt,
      'fullDay': instance.fullDay,
    };
