import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'today_history.g.dart';

@JsonSerializable()
class TodayHistory {
  int? status;
  String? msg;
  List<Result>? result;

  TodayHistory({this.status, this.msg, this.result});

  factory TodayHistory.fromJson(Map<String, dynamic> json) =>
      _$TodayHistoryFromJson(json);

  Map<String, dynamic> toJson() => _$TodayHistoryToJson(this);
}
